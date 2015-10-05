package com.erikdeijl.cpconsoleapp.cpconsoleapp;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;

public class HaskellActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        onCreateHS(savedInstanceState);
        setContentView(R.layout.activity_haskell);

    }

    public native void onCreateHS(Bundle savedInstanceState);
    static { System.loadLibrary("haskell"); }
}
