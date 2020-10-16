package com.weberth.uri_app;


import android.util.Log;

import java.util.ArrayList;
import java.util.Map;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "uri_app";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (input, output) -> {
                            switch (input.method) {
                                case "actionSomar":{
                                    int numero1 = input.argument("numero1");
                                    int numero2 = input.argument("numero2");
                                    Integer resultado = actionSomar(numero1, numero2);
                                    output.success(resultado);
                                    break;
                                }

                                case "actionSalario":{
                                    double fixo  = input.argument("fixo");
                                    double vendas = input.argument("vendas");
                                    double resultado = actionSalario(fixo, vendas);
                                    output.success(resultado);
                                    break;
                                }
                                case "actionCelulas":{
                                    int valor  = input.argument("valor");
                                    ArrayList resultado = actionCelulas(valor); 
                                    output.success(resultado);
                                    break;
                                }
                                case "actionCalcular":{
                                    int nota = input.argument("nota");
                                    String resultado = actionCalcular(nota);
                                    output.success(resultado);
                                    break;
                                }


                                default:
                                output.notImplemented();
                            }
                        });
    }
    private String actionCalcular(int nota) {
        String resp = "--";

        if (nota <= 100 && nota>=86) {
			resp = ("A");
		}
		
		if (nota <= 85 && nota>=61) {
			resp = ("B");
		}
		
		if (nota <= 60 && nota>=36) {
			resp = ("C");
		}
		
		if (nota <= 35 && nota>=1) {
			resp = ("D");
		}
		
		if (nota == 0) {
			resp = ("E");
		}

        return resp;
    }



    private Integer actionSomar(int numero1, int numero2) {
        int resp;
        resp = numero1 + numero2;
        return resp;
    }

    private Double actionSalario(Double fixo, Double vendas) {
        Double comissao;
        comissao = fixo + (vendas * 0.15);
        return comissao;
    }

    private ArrayList<String> actionCelulas(int valor){
        ArrayList<String> notas = new ArrayList<>();
        notas.add(valor / 100 + " nota(s) de R$ 100,00");
        valor %= 100;
        notas.add(valor / 50 + " nota(s) de R$ 50,00");
        valor %= 50;
        notas.add(valor / 20 + " nota(s) de R$ 20,00");
        valor %= 20;
        notas.add(valor / 10 + " nota(s) de R$ 10,00");
        valor %= 10;
        notas.add(valor / 5 + " nota(s) de R$ 5,00");
        valor %= 5;
        notas.add(valor / 2 + " nota(s) de R$ 2,00");
        valor %= 2;
        notas.add(valor / 1 + " nota(s) de R$ 1,00");

        //String notas2[]=notas.toArray(new String[notas.size()]);

        return notas;
    }



}