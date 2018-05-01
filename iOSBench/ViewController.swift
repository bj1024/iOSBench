//
//  ViewController.swift
//  iOSBench
//


//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func onTouchStart(_: Any) {
		benchMarkSet()
	}

	func benchMarkSet() {

		benchMark(100)
		benchMark(1000)
		benchMark(10000)
		benchMark(100000)
		benchMark(1000000)
		benchMark(10000000)
//		benchMark(100000000)
	}

	func benchMark(_ itemnum: Int) {
		var srcAry: [String] = []

		let randStr = randomString(length: 8192)
		let createTime = measureProcTime(
			trynum: 3,
			proc: {
				srcAry.removeAll()
				for _ in 0 ..< itemnum {
					srcAry.append(randStr)
				}
			}
		)

		let proctime = measureProcTime(
			trynum: 10,
			proc: {
				var destary = srcAry
				destary[1] = "test"
			}
		)

		print(String(format: "%10d,%1.6f,%1.6f",itemnum, createTime, proctime))
	}

	func randomString(length: Int) -> String {

		let letters: NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
		let len = UInt32(letters.length)

		var randomString = ""

		for _ in 0 ..< length {
			let rand = arc4random_uniform(len)
			var nextChar = letters.character(at: Int(rand))
			randomString += NSString(characters: &nextChar, length: 1) as String
		}

		return randomString
	}

	func measureProcTime(trynum: Int, proc: () -> Void ) -> Double {
		let startTime = Date()
		for _ in 0 ..< trynum {
			proc()
		}
		return -1.0 * Double(startTime.timeIntervalSinceNow) / Double(trynum)
	}
}
