
import UIKit

class ViewController: UIViewController {

    @IBOutlet var bpmControlView: BpmControlView! {
        didSet {
            bpmControlView.delegate = self
        }
    }
    @IBOutlet var bpmLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bpmLabel.text = "\(bpmControlView.bpmValue)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ViewController: BpmControlViewDelegate {
    
    func bpmControlView(_ view: BpmControlView, didChange state: BpmControlViewState) {
        bpmLabel.text = "\(view.bpmValue)"
    }
}
