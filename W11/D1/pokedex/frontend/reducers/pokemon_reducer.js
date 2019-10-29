import { RECEIVE_ALL_POKEMON } from '../actions/pokemon_actions';


export default function pokmonReducer(state = {}, action) {
    switch (action.type) {
        case RECEIVE_ALL_POKEMON:
            return {
                ...state,
            }

        default:
            return state
    }
}