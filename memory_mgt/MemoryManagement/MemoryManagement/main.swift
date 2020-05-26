//
//  main.swift
//  MemoryManagement
//
//  Created by Jon Hoffman on 5/6/19.
//  Copyright © 2019 Jon Hoffman. All rights reserved.
//

import Foundation
//structs
//Structures are value types. What this means is that when an instance of a structure is passed within our application, such as a parameter for a method, a new instance of the structure is created in the memory. This new instance of the structure is only valid while the application is in the scope where the structure was created. Once the structure goes out of scope, the new instance of the structure is destroyed, and the memory is released. This makes the memory management of structures pretty easy and somewhat painless.

//classes
//Classes, on the other hand, are reference types. This means that memory is allocated once when the instance of the class is initially created. When an instance of the class is passed within our application, either as a function argument or by assigning it to a variable, a reference to the original instance is passed. Since the instance of a class may be referenced in multiple scopes (unlike a structure), it cannot be automatically destroyed, and memory is not released when it goes out of scope if it is referenced in another scope .Swift needs some form of memory management to track and release the memory used by instances of classes when the class is no longer
//needed.swift uses arc to handle this memory leak

print("Hello, World!")

var class1ref1: MyClass? = MyClass(name: "One")
var class2ref1: MyClass? = MyClass(name: "Two")
var class2ref2: MyClass? = class2ref1

print("Setting class1ref1 to nil")
class1ref1 = nil
print("Setting class2ref1 to nil")
class2ref1 = nil
print("Setting class2ref2 to nil")
class2ref2 = nil
