package org.haskell;

import android.app.Activity;
import android.os.Bundle;

public class HaskellActivity extends Activity
{
    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        onCreateHS(this, savedInstanceState);
    }

    public native void onCreateHS();
    static { System.loadLibrary("hw-prebuilt"); }
}
