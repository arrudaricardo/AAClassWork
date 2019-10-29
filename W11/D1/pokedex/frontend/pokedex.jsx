import React from 'react';
import ReactDOM from 'react-dom';

//test import
import { fetchAllPokemon } from './util/api_util';
import {receiveAllPokemon} from './actions/pokemon_actions'
window.receiveAllPokemon = receiveAllPokemon;
window.fetchAllPokemon = fetchAllPokemon;

//
document.addEventListener('DOMContentLoaded', () => {
    let root = document.getElementById('root');
    ReactDOM.render(<h1>hello</h1>, root)


})


