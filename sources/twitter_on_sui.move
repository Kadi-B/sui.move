/*
/// Module: twitter_on_sui
module twitter_on_sui::twitter_on_sui;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module twitter_on_sui::twitter_on_sui;
use std::ascii::String;

public struct UserProfile has key {
    id: UID, 
    username: String,
    bio: String,
    points: u64,
    followers: u64,
    following: u64,
    posts: vector<object::ID>,
}


public fun new_UserProfile(username: String, bio: String, ctx: &mut TxContext)

let user: UserProfile = UserProfile {
    id: object::new(ctx),
    username: username,
    bio,
    points: 0,
    followers: 0,
    following: 0,
    posts: vector<object::ID>
};

//transfer::transfer(obj: user, recpient: ctx.sender());
//}

public struct Post has key, store {
   // user: UserProfile,
    id: UID,   
    like: u64,
    retweets: u64,
    reposts: u64,
    points_gen: u64
    post: String, 
}

public fun new_user(username: String, bio: String, ctx: &mut TxContext): UserProfile {
    let user: UserProfile = UserProfile {
        id: object::new(ctx:ctx),
        username,
        bio,
        points: 0,
        followers: 0,
        following: 0,
        posts: vector::empty(),
    };

    transfer::transfer(obj: user, recipient: ctx.sender());
}

public fun create_post(user: &mut userprofile, post: string, 
 ctx: &mut TxContext) {   //&mut means you don't want the whole object just borrowing it
    let new_post: Post = Post {
        id: object::new(ctx: ctx),
        likes: 0,
        retweet: 0,
        repost: 0,
        points_gen: 0,
        post,
    };
    
    user.posts.push_back(e: new_post.id.to_inner());                 //push_back is used to add an element to the end of a vector
    user.points = user.points + 5;                                   //increment points by 5 for creating a post
    transfer::public_share_object (obj: new_post);
}











