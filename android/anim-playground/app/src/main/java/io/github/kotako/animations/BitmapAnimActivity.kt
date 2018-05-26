package io.github.kotako.animations

import android.content.Context
import android.content.Intent
import android.graphics.drawable.Animatable
import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.view.MenuItem
import kotlinx.android.synthetic.main.activity_bitmap_anim.*

class BitmapAnimActivity : AppCompatActivity() {

    private var isClicked = false

    companion object {
        fun start(context: Context) {
            context.startActivity(Intent(context, BitmapAnimActivity::class.java))
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_bitmap_anim)
        supportActionBar?.setDisplayHomeAsUpEnabled(true)

//      https://developer.android.com/reference/android/graphics/drawable/AnimatedVectorDrawable
//      AnimatedVectorDrawableを用いてベクター画像　動くけどいけてない感じ
        image_menu_to_back.setOnClickListener {
            if (isClicked) {
                image_menu_to_back.setImageDrawable(getDrawable(R.drawable.ic_anim_back_to_menu))
            } else {
                image_menu_to_back.setImageDrawable(getDrawable(R.drawable.ic_anim_menu_to_back))
            }
            (image_menu_to_back.drawable as Animatable).start()
            isClicked = isClicked.not()
        }
    }

    override fun onOptionsItemSelected(item: MenuItem?): Boolean {
        finish()
        return super.onOptionsItemSelected(item)
    }
}