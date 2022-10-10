import UIKit

var array1 = [10,5,3,2,4]

class MaxHeap {
    
    func swap(_ array: inout [Int] , _ first : Int, _ second: Int) {
        let temp = array[first]
        array[first] = array[second]
        array[second] = temp
    }
        
    func heapify(_ array: inout [Int] , _ size : Int, _ root: Int) {
        let left = 2 * root + 1
        let right = 2 * root + 2
        var larger = root
        if (left < size && array[left] > array[larger]) {
            larger = left
        }
        if (right < size && array[right] > array[larger]) {
            larger = right
        }
        if larger != root {
            self.swap(&array, root, larger)
            self.heapify(&array, size, larger)
        }
    }
    
    func insertMaxHeap(_ array: inout [Int], _ size: Int, _ value: Int) {
        array.append(value)
        var lastIndex = array.count - 1
        while(lastIndex >= 1) {
            let parent = (lastIndex-1)/2
            if array[parent] < array[lastIndex] {
                let temp = array[parent]
                array[parent] = array[lastIndex]
                array[lastIndex] = temp
                lastIndex = parent
            } else {
                return
            }
        }
    }

    func deleteMaxHeap(_ array: inout [Int], _ size: Int) {
        array[0] = array[size - 1]
        let size = size - 1
        var root = 0
        while(root < size) {
            let left = array[2*root + 1]
            let right = array[2*root + 2]
            let larger = left > right ? 2*root + 1 : 2*root + 2
            if array[root] < array[larger] {
                let temp = array[root]
                array[root] = array[larger]
                array[larger] = temp
                root = larger
            } else {
                return
            }
        }
    }
    
    func createMaxHeap(_ array: inout [Int], _ size : Int) {
        var index = (size / 2) - 1
        while (index >= 0) {
            self.heapify(&array, size, index)
            index -= 1
        }
    }
    
    func heapSort(_ array: inout [Int], _ size : Int) {
        self.createMaxHeap(&array, size)
        var lastIndex = size - 1
        while (lastIndex > 0) {
            self.swap(&array, 0, lastIndex)
            self.heapify(&array, lastIndex - 1, 0)
            lastIndex -= 1
        }
    }
}

let maxheap = MaxHeap()

maxheap.createMaxHeap(&array1, array1.count)
print(array1)

maxheap.deleteMaxHeap(&array1, array1.count)
array1.removeLast()
print(array1)

maxheap.insertMaxHeap(&array1, array1.count, 15)
print(array1)

maxheap.heapSort(&array1, array1.count)
print(array1)
