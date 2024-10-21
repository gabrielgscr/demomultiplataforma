import React, { useRef, useEffect } from 'react';
import { View, Image, Animated, Easing, StyleSheet } from 'react-native';

export default function App() {
  // Valor animado que controlará la rotación
  const rotateValue = useRef(new Animated.Value(0)).current;

  // Configurar la animación de rotación
  useEffect(() => {
    const rotateAnimation = Animated.loop(
      Animated.timing(rotateValue, {
        toValue: 1,
        duration: 2000, // Duración en milisegundos (4 segundos para un ciclo completo)
        easing: Easing.linear, // Animación lineal
        useNativeDriver: true, // Usa el controlador nativo para un rendimiento mejorado
      })
    );
    rotateAnimation.start();
  }, [rotateValue]);

  // Interpolar el valor animado para que gire de 0 a 360 grados
  const rotateInterpolate = rotateValue.interpolate({
    inputRange: [0, 1],
    outputRange: ['0deg', '360deg'],
  });

  // Aplicar la rotación al estilo de la imagen
  const animatedStyle = {
    transform: [{ rotate: rotateInterpolate }],
  };

  return (
    <View style={styles.container}>
      <Animated.Image
        source={require('./assets/pocoyo.png')} // Imagen local
        style={[styles.image, animatedStyle]}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#fff',
  },
  image: {
    width: 180,
    height: 250,
  },
});


// import { StatusBar } from 'expo-status-bar';
// import { StyleSheet, Text, View } from 'react-native';

// export default function App() {
//   return (
//     <View style={styles.container}>
//       <Text>Open up App.js to start working on your app</Text>
//       <StatusBar style="auto" />
//     </View>
//   );
// }

// const styles = StyleSheet.create({
//   container: {
//     flex: 1,
//     backgroundColor: '#fff',
//     alignItems: 'center',
//     justifyContent: 'center',
//   },
// });
