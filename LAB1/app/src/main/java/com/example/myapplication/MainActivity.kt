package com.example.myapplication

import android.os.Bundle
import android.text.Editable
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.google.android.material.textfield.TextInputEditText

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val input = findViewById<TextInputEditText>(R.id.textInputEditText) as TextInputEditText
        val btn = findViewById<Button>(R.id.calculeaza) as Button
        val output=findViewById<TextView>(R.id.output) as TextView
        btn.setOnClickListener {
            output.text = "In textul introdus sunt: " + calc(input.text) +
                    " cuvinte ce contin A sau a"
        }
    }
}


    fun calc(input: Editable?): String {
        var words=0
        for (word in input.toString().split(" ")){
            if (word.contains('a') || word.contains('A')  ) words++
        }
        return words.toString()
    }