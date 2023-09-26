import * as ExpoQuickLook from "expo-quicklook";

import { Text, View } from "react-native";

export default function App() {
  return (
    <View
      style={{
        flex: 1,
        backgroundColor: "#fff",
        alignItems: "center",
        justifyContent: "center",
      }}
    >
      <Text>{ExpoQuickLook.hello()}</Text>
    </View>
  );
}
