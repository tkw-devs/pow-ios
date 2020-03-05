//
// License DTO
//

import Foundation

struct LicenseDTO: Codable {
    let key: String?
    let name: String?
    let spdxID: String?
    let url: String?
    let nodeID: String?

    enum CodingKeys: String, CodingKey {
        case key, name
        case spdxID = "spdx_id"
        case url
        case nodeID = "node_id"
    }
}
