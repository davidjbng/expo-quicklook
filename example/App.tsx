import { StyleSheet, Text, View } from "react-native";

import * as ExpoQuickLook from "expo-quicklook";

export default function App() {
  return (
    <View style={styles.container}>
      <Text>{ExpoQuickLook.hello()}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
});
