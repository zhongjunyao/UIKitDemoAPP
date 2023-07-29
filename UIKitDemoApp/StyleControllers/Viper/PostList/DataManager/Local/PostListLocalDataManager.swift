//
//  PostListLocalDataManager.swift
//  iOS-Viper-Study
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/21.
//

import CoreData

class PostListLocalDataManager: PostListLocalDataManagerInputProtocol {
    
    func retrievePostList() throws -> [Post]  {
        
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        let request: NSFetchRequest<Post> = NSFetchRequest(entityName: String(describing: Post.self))
        
        return try managedOC.fetch(request)
    }
    
    func savePost(id: Int, title: String, imageUrl: String, thumbImageUrl: String, detail: String) throws {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        if let newPost = NSEntityDescription.entity(forEntityName: "Post", in: managedOC) {
            let post = Post(entity: newPost, insertInto: managedOC)
            post.id = Int32(id)
            post.title = title
            post.imageUrl = imageUrl
            post.thumbImageUrl = thumbImageUrl
            post.detail = detail
            try managedOC.save()
        }
        throw PersistenceError.couldNotSaveObject
    }
    
}
