// #Title: ATM App
//
// ###Type:
// - Lab
//
// ###Summary
// - This lab will help you practice JavaScript functions and manipulating the DOM with jQuery.
// - You'll be selecting elements, manipulating HTML, and manipulating style along
// with building out the logic using JavaScript.
//
// ###Objectives:
// - DOM selection, appending, removal, updating
//
// ###Specification:
//
// * Keep track of the checking and savings balances somewhere

// * Add functionality so that a user can deposit money into one of the bank accounts.

// * Make sure you are updating the display and manipulating the HTML of the page so a user can see the change.

// * Add functionality so that a user can withdraw money from one of the bank accounts.

// * Make sure you are updating the display and manipulating the HTML of the page so a user can see the change.

// * Make sure the balance in an account can't go negative. If a user tries to withdraw more money than exists in the account, ignore the transaction.

// * When the balance of the bank account is $0 the background of that bank account should be red. It should be gray when there is money in the account.

// * What happens when the user wants to withdraw more money from the checking account than is in the account? These accounts have overdraft protection, so if a withdrawal can be covered by the balances in both accounts, take the checking balance down to $0 and take the rest of the withdrawal from the savings account.

// If the withdrawal amount is more than the combined account balance, ignore it.

// * Make sure there is overdraft protection going both ways.

// * Are there ways to refactor your code to make it DRYer?

// const balance = //get the amount from the html and if there is an event on the deposit button then add funds to it - if there is an event to withdraw funds then minus funds


$( document ).ready( function() {

  $('input[type=text]').attr('type', 'text').prop('type', 'number');

  let checkingBalance = Number($('div#checking-balance').html().split('$').join(''));
  let savingsBalance = Number($('div#savings-balance').html().split('$').join(''));

  //Checking Deposit
  $('#checking-deposit').on('click', function() {
    checkingBalance = checkingBalance + Number($('input#checking-amount').val());
    if (checkingBalance > 0) {
        $('.balance#checking-balance').removeClass('zero')
      };
    $('#checking-balance').html('$' + (checkingBalance));
  })

  //Checking Withdrawal
  $('#checking-withdraw').on('click', function() {
    $('#checking-balance').html('$' + (checkingBalance -= $('input#checking-amount').val()));
    if (checkingBalance <= 0) {
        $('.balance#checking-balance').addClass('zero')
      } else {
        $('.balance#checking-balance').removeClass('zero')
      }
  })

  //Savings Deposit
  $('#savings-deposit').on('click', function() {
    savingsBalance = savingsBalance + Number($('input#savings-amount').val());
    $('#savings-balance').html('$' + (savingsBalance));
    if (savingsBalance > 0) {
        $('.balance#savings-balance').removeClass('zero')
      }
  })

  //Savings Withdrawal
  $('#savings-withdraw').on('click', function() {
    $('#savings-balance').html('$' + (savingsBalance -= $('input#savings-amount').val()));
    if (savingsBalance <= 0) {
        $('.balance#savings-balance').addClass('zero')
      } else {
        $('.balance#savings-balance').removeClass('zero')
      }
  })

});

//DRY function
// let newCheckInput = Number($('input#checking-amount').val());
// let origBalance = Number($('div#checking-balance').html().split('$').join(''));
// $('input[type=button]').on('click', function() {
//
//   let balance = 0;
//   let newInput = Number($('input[type=number]').val());
//   balance = balance + newInput;
//   if ($('input[type=button]').parent('div').is('#checking')) {
//     $('#checking-balance').html('$' + balance);
//   } else {
//     $('#savings-balance').html('$' + balance);
//   }
//
//   if (balance <= 0) {
//     $('.account').addClass('zero')
//   } else {
//     $('.account').removeClass('zero')
//   }
// })

//Joel's code
$('#checking-deposit').on('click', function() {
  const amount = +$('#checking-amount').val();
  const currentBalance = +$('checking-balance').text().slice(1);

  const newBalance = amount + currentBalance;
  $('#checking-balance').text('$' + newBalance);
  $('#checking-amount').val('').focus();
  if (newBalance > 0) {
      $('.balance#checking-balance').removeClass('zero')
    };

})

$('#checking-withdraw').on('click', function() {
  const amount = +$('#checking-amount').val();
  const currentBalance = +$('checking-balance').text().slice(1);

  const otherBalance = +$('savings-balance').text().slice(1);
  const totalBalance = currentBalance - amount;

  const newBalance = amount - currentBalance;

  if (newBalance >= 0) {
    $('#checking-balance').text('$' + newBalance);
    $('#checking-amount').val('').focus();
    $('.balance#checking-balance').removeClass('zero')
  } else if (amount <= totalBalance) {
    $('#checking-balance').text('$0')
    $('#savings-balance').text('$' + (otherBalance + newBalance))
    $('.balance#checking-balance').addClass('zero');
  };
})
