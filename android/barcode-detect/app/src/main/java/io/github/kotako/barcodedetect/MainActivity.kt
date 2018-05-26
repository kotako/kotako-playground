package io.github.kotako.barcodedetect

import android.graphics.BitmapFactory
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import com.google.android.gms.vision.Frame
import com.google.android.gms.vision.barcode.Barcode
import com.google.android.gms.vision.barcode.BarcodeDetector
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

//      load image
//      今回はbitmapだけど実際はカメラの画像とかね
        val bitmap = BitmapFactory.decodeResource(resources, R.drawable.sample_barcode)
        imageView.setImageBitmap(bitmap)

//      Setup the Barcode Detector
//      Activity Contextだと必要な情報が足りないっぽいからApplicationContextつかう
        val detector = BarcodeDetector.Builder(applicationContext)
                .setBarcodeFormats(Barcode.DATA_MATRIX or Barcode.QR_CODE)
                .build()

        if (!detector.isOperational) {
            textView.text = getString(R.string.msg_cant_set_detector)
            return
        }

//      Detect the Barcode
//      bitmap内に複数のバーコードが存在していたらbarcodesの配列に全部はいってくる
        val frame = Frame.Builder().setBitmap(bitmap).build()
        val barcodes = detector.detect(frame)

        textView.text = barcodes.valueAt(0).rawValue
    }
}
