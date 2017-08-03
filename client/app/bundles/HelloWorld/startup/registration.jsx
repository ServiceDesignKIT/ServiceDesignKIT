import ReactOnRails  from 'react-on-rails';
import App           from '../components/App';
import Favorites     from '../components/Favorites';
import AddToFavorite from '../components/addToFavorite';
import AdminPosts    from '../components/admin/PostList';
import AdminHeader   from '../components/admin/Header';
import UserHeader    from '../components/Header';
import Footer    from '../components/Footer';

import Login   from '../components/devise/Login';
import SignUp  from '../components/devise/SignUp';
import ShowPost  from '../components/posts/showPost';
import CreatePost  from '../components/posts/createPost';
import EditPost    from '../components/posts/editPost';
import EditPassword  from '../components/devise/EditPassword';
import UserEdit      from '../components/devise/UserEdit';
import ResetPassword  from '../components/devise/ResetPassword';
import ConfirmationInstruction  from '../components/devise/ConfirmationInstruction';


// This is how react_on_rails can see the HelloWorld in the browser.
document.addEventListener("turbolinks:load", () => {
  console.log('Turbolinks load')
  Turbolinks.clearCache()
})

ReactOnRails.register({
  App,
  Favorites,
  AddToFavorite,
  UserHeader,
  Footer,
  AdminPosts,
  AdminHeader,
  ConfirmationInstruction,
  Login,
  SignUp,
  ResetPassword,
  EditPassword,
  UserEdit,
  CreatePost,
  EditPost,
  ShowPost
});

Array.prototype.containsArray = function ( array /*, index, last*/ ) {

    if( arguments[1] ) {
        var index = arguments[1], last = arguments[2];
    } else {
        var index = 0, last = 0; this.sort(); array.sort();
    };

    return index == array.length
        || ( last = this.indexOf( array[index], last ) ) > -1
        && this.containsArray( array, ++index, ++last );

};