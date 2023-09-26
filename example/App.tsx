import { openPreviewAsync } from "expo-quicklook";
import { Button, View } from "react-native";

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
      <Button
        onPress={() =>
          openPreviewAsync(
            "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
          )
        }
        title="Open File"
      />
    </View>
  );
}
