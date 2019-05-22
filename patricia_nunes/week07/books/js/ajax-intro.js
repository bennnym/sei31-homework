const SearchForm = props => (
  <form onSubmit={e => props.onSearch(e)}>
    <label>
      <span className="app-searchlabel">What are you looking for?</span>
      <input
        className="app-searchfield"
        type="text"
        autoFocus
        value={props.term}
        placeholder="📚 seach for books. e.g.: Real World Haskell"
        onChange={e => {props.onTermChange(e.target.value)}}
      />
    </label>
  </form>
);

const SearchResults = props => {
  const { results, loading } = props;

  return loading ? <span>Loading...</span> : (
    <div>
      <h1>Your searched for: {props.term}</h1>

      <ul className="app-results">
        {!!results.length ? results.map((item, index) => (
          <li key={`${item.id}-${index}`}>
            {
              item.volumeInfo.imageLinks ?
              <a href={item.volumeInfo.infoLink}>
                <img src={item.volumeInfo.imageLinks.smallThumbnail} />
              </a> :
              <span className="app-noimage">No image</span>
            }
          </li>
        )) : <p>No results found</p>}
      </ul>
    </div>
  );
};

const App = () => {
  const [searchTerm, setSearchTerm] = React.useState('');
  const [results, setResults] = React.useState([]);
  const [submitted, setSubmitted] = React.useState(false);
  const [loading, setLoading] = React.useState(false);

  const search = async e => {
    e.preventDefault()
    setLoading(true);
    setSubmitted(true);

    const searchResults = await window.fetch(`https://www.googleapis.com/books/v1/volumes?q={${searchTerm}}`)
      .then(r => r.json());

    setLoading(false);
    setResults(searchResults.items || []);
  };

  const termChange = (v) => {
    setSearchTerm(v);
    setSubmitted(false);
  };

  return (
    <div className="app-container">
      <h1>Boogle</h1>
      <SearchForm
        term={searchTerm}
        onTermChange={v => termChange(v)}
        onSearch={e => search(e)}
      />
      {submitted && <SearchResults term={searchTerm} results={results} loading={loading} />}
    </div>
  );
};


ReactDOM.render(
  <App />,
  document.getElementById('root')
);
