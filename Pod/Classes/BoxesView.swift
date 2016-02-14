//
//  BoxesView.swift
//  BoxesView
//
//  Created by Lammert Westerhoff on 14/02/16.
//  Copyright © 2016 Lammert Westerhoff. All rights reserved.
//

import Foundation
import SnapKit

public class BoxesView: UIView {

    @IBInspectable public var columns: Int = 2 {
        didSet {
            layoutBoxes()
        }
    }
    @IBInspectable public var rowHeight: Float = 0 {
        didSet {
            layoutBoxes()
        }
    }

    private var rows = [UIView]()

    public var boxes = [UIView]() {
        didSet {
            layoutBoxes()
        }
    }

    private func layoutBoxes() {
        rows.forEach { $0.removeFromSuperview() }
        rows = []

        var row: UIView!
        let totalRows = Int(ceil(Double(boxes.count) / Double(columns)))
        for rowIndex in 0 ..< totalRows {
            row = UIView()
            row.opaque = self.opaque
            row.backgroundColor = self.backgroundColor
            rows.append(row)
            addSubview(row)

            row.snp_makeConstraints { make in
                make.left.equalTo(self)
                make.right.equalTo(self)
                if rowHeight > 0 {
                    make.height.equalTo(rowHeight)
                }

                if rowIndex == 0 {
                    make.top.equalTo(self)
                } else {
                    make.top.equalTo(rows[rowIndex - 1].snp_bottom)
                }

                if (rowIndex + 1) * columns >= boxes.count {
                    make.bottom.lessThanOrEqualTo(self)
                }
            }

            var previousColum: UIView?
            for columnIndex in 0 ..< columns {
                let column = UIView()
                row.opaque = self.opaque
                row.backgroundColor = self.backgroundColor

                row.addSubview(column)

                column.snp_makeConstraints { make in
                    make.top.equalTo(row)
                    make.bottom.equalTo(row)

                    make.centerY.equalTo(row)

                    if let previousColum = previousColum {
                        make.left.equalTo(previousColum.snp_right)
                        make.width.equalTo(previousColum)
                    } else {
                        make.left.equalTo(row)
                    }

                    if columnIndex + 1 == columns {
                        make.right.equalTo(row)
                    }
                }

                previousColum = column

                let boxIndex = rowIndex * columns + columnIndex
                if boxIndex < boxes.count {
                    let box = boxes[boxIndex]
                    column.addSubview(box)

                    box.snp_makeConstraints { make in
                        make.top.equalTo(column).priorityLow()
                        make.bottom.equalTo(column).priorityLow()
                        make.top.greaterThanOrEqualTo(column).priorityHigh()
                        make.bottom.lessThanOrEqualTo(column).priorityHigh()
                        make.center.equalTo(column)
                        make.left.equalTo(column).priorityLow()
                        make.right.equalTo(column).priorityLow()
                        make.left.greaterThanOrEqualTo(column).priorityHigh()
                        make.right.lessThanOrEqualTo(column).priorityHigh()
                    }
                }
            }

        }
    }
}
