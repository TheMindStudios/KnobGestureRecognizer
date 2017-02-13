
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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: BpmControlViewDelegate {
    
    func bpmControlView(_ view: BpmControlView, didChange state: BpmControlViewState) {
        bpmLabel.text = "\(view.bpmValue)"
    }
}
