import { combineReducer } from 'redux';
import pokemonReducer from './pokemon_reducer'


const entitiesReucer = combineReducer({
    pokemon: pokemonReducer,
})

export default entitiesReucer;