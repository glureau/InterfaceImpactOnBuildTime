package com.glureau.interfaceimpactonbuildtime

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.glureau.javanointerface.generated.FactoryNoInterface
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        textView.text = FactoryNoInterface.create().A1()
    }
}
