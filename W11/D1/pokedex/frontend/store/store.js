import { createStore, applyMiddleware} from 'redux';
import rootReducer from '../reducers/root_reducer';
import logger from 'redux-loger';


const configureStore = () => createStore(rootReducer, applyMiddleware(logger));
