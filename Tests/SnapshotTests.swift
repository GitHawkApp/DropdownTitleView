//
//  SnapshotTests.swift
//  Tests
//
//  Created by Ryan Nystrom on 10/21/18.
//  Copyright © 2018 Ryan Nystrom. All rights reserved.
//

import XCTest
import Snap_swift
@testable import DropdownTitleView

class Tests: XCTestCase {

    override func setUp() {
//        isRecording = true
    }

    func test_withTitle_withSubtitle_withChevron_withBackgrounds_whenSettingFrame() {
        let view = DropdownTitleView()
        view.titleLabel.backgroundColor = .red
        view.subtitleLabel.backgroundColor = .purple
        view.chevron.backgroundColor = .green
        view.backgroundColor = .black
        view.configure(title: "Hello world!", subtitle: "Is this thing on?")
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 200)
        expect(view).toMatchSnapshot()
    }

    func test_withTitle_withSubtitle_withChevron_withBackgrounds_whenSizeToFit() {
        let view = DropdownTitleView()
        view.titleLabel.backgroundColor = .red
        view.subtitleLabel.backgroundColor = .purple
        view.chevron.backgroundColor = .green
        view.backgroundColor = .black
        view.configure(title: "Hello world!", subtitle: "Is this thing on?")
        view.sizeToFit()
        expect(view).toMatchSnapshot()
    }

    func test_withTitle_withSubtitle_withChevron_withChevronTint_withFonts_withTextColors() {
        let view = DropdownTitleView()
        view.configure(title: "Hello world!", subtitle: "Is this thing on?")
        view.chevronTintColor = .red
        view.titleFont = UIFont.italicSystemFont(ofSize: 18)
        view.subtitleFont = UIFont.boldSystemFont(ofSize: 8)
        view.titleColor = .green
        view.subtitleColor = .purple
        view.sizeToFit()
        expect(view).toMatchSnapshot()
    }

    func test_withTitle_withSubtitle() {
        let view = DropdownTitleView()
        view.chevronTintColor = .red
        view.configure(title: "Hello world!", subtitle: "Is this thing on?", chevronEnabled: false)
        view.sizeToFit()
        expect(view).toMatchSnapshot()
    }

    func test_withTitle_withChevron() {
        let view = DropdownTitleView()
        view.chevronTintColor = .red
        view.configure(title: "Hello world!")
        view.sizeToFit()
        expect(view).toMatchSnapshot()
    }

    func test_withTitle() {
        let view = DropdownTitleView()
        view.chevronTintColor = .red
        view.configure(title: "Hello world!", chevronEnabled: false)
        view.sizeToFit()
        expect(view).toMatchSnapshot()
    }

    func test_withTitle_withSubtitle_WithChevron_withTruncatingSubtitle() {
        let view = DropdownTitleView()
        view.chevronTintColor = .red
        view.configure(title: "Hello world!", subtitle: "This is a really long subtitle that needs to truncate")
        view.frame = CGRect(x: 0, y: 0, width: 150, height: 100)
        expect(view).toMatchSnapshot()
    }

    func test_withTitle_withSubtitle_WithChevron_withTruncatingTitle() {
        let view = DropdownTitleView()
        view.chevronTintColor = .red
        view.configure(title: "This is a really long title that needs to truncate", subtitle: "Hello world!")
        view.frame = CGRect(x: 0, y: 0, width: 150, height: 100)
        expect(view).toMatchSnapshot()
    }

    func test_withTitle_withSubtitle_WithChevron_withAutoresizingTitle() {
        let view = DropdownTitleView()
        view.chevronTintColor = .red
        view.configure(title: "This is a longish title", subtitle: "Hello world!")
        view.frame = CGRect(x: 0, y: 0, width: 130, height: 100)
        expect(view).toMatchSnapshot()
    }

    func test_withTitle_withSubtitle_WithChevron_withAutoresizingSubtitle() {
        let view = DropdownTitleView()
        view.chevronTintColor = .red
        view.configure(title: "Hello world!", subtitle: "This is a longish subtitle")
        view.frame = CGRect(x: 0, y: 0, width: 130, height: 100)
        expect(view).toMatchSnapshot()
    }

    func test_withUIAppearance() {
        DropdownTitleView.appearance().chevronTintColor = .red
        DropdownTitleView.appearance().titleFont = UIFont.italicSystemFont(ofSize: 15)
        DropdownTitleView.appearance().subtitleFont = UIFont.italicSystemFont(ofSize: 12)
        DropdownTitleView.appearance().titleColor = .green
        DropdownTitleView.appearance().subtitleColor = .blue

        let view = DropdownTitleView()
        view.configure(title: "Hello world!", subtitle: "Is this thing on?")
        view.sizeToFit()
        expect(view).toMatchSnapshot()
    }

    func test_withNavigationController() {
        let view = DropdownTitleView()
        view.configure(title: "Hello world!", subtitle: "Is this thing on?")
        let controller = UIViewController()
        controller.view.backgroundColor = .white
        controller.navigationItem.titleView = view
        let nav = UINavigationController(rootViewController: controller)
        // required to layout/draw nav bar
        nav.navigationBar.snapshotView(afterScreenUpdates: true)
        expect(nav.view).toMatchSnapshot()
    }

    func test_withNavigationController_withItems_withAutoresizingSubtitle() {
        let view = DropdownTitleView()
        view.configure(title: "Hello world!", subtitle: "This is a longish subtitle that really needs to try to autoresize")
        let controller = UIViewController()
        controller.view.backgroundColor = .white
        controller.navigationItem.titleView = view
        let nav = UINavigationController(rootViewController: controller)
        // required to layout/draw nav bar
        nav.navigationBar.snapshotView(afterScreenUpdates: true)
        expect(nav.view).toMatchSnapshot()
    }

    func test_withNavigationController_withAutoresizingTitle() {
        let view = DropdownTitleView()
        view.configure(title: "This is a longish title that really needs to try to autoresize", subtitle: "Is this thing on?")
        let controller = UIViewController()
        controller.view.backgroundColor = .white
        controller.navigationItem.titleView = view
        let nav = UINavigationController(rootViewController: controller)
        // required to layout/draw nav bar
        nav.navigationBar.snapshotView(afterScreenUpdates: true)
        expect(nav.view).toMatchSnapshot()
    }

    func test_withNavigationController_withBarItem_withTruncatingSubtitle() {
        let view = DropdownTitleView()
        view.configure(title: "Hello world!", subtitle: "This is a really really REALLY long subtitle that is so really long that it has to truncate")
        let controller = UIViewController()
        controller.view.backgroundColor = .white
        controller.navigationItem.titleView = view
        controller.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
        let nav = UINavigationController(rootViewController: controller)
        // required to layout/draw nav bar
        nav.navigationBar.snapshotView(afterScreenUpdates: true)
        expect(nav.view).toMatchSnapshot()
    }

    func test_withNavigationController_withBarItem_withTruncatingTitle() {
        let view = DropdownTitleView()
        view.configure(title: "This is a really really long title that is so really long that it has to truncate", subtitle: "Is this thing on?")
        let controller = UIViewController()
        controller.view.backgroundColor = .white
        controller.navigationItem.titleView = view
        controller.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
        let nav = UINavigationController(rootViewController: controller)
        // required to layout/draw nav bar
        nav.navigationBar.snapshotView(afterScreenUpdates: true)
        expect(nav.view).toMatchSnapshot()
    }

}
