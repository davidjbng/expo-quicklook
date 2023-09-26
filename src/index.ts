import ExpoQuickLookModule from "./ExpoQuickLookModule";

export async function openPreviewAsync(url: string) {
  return await ExpoQuickLookModule.openPreviewAsync(url);
}
