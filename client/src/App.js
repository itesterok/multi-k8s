import React from 'react';
import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom'
import OtherPage from './OtherPage';
import Fib from './Fib';

function App() {
  return (
	<Router>
		<div>
			<header>
			  <h1 className="App-title">Fib Caluclator version KUBERNETES!</h1>
				<Link to="/">Home</Link>
				<div />
				<Link to="/otherpage">Other Page</Link>
			</header>
			<div>
				<Route exact path="/" component={Fib} />
				<Route exact path="/otherPage" component={OtherPage} />
			</div>
		</div>
	</Router>
  );
}

export default App;
