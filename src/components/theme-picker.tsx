import { createSignal, onCleanup, onMount, Show, type JSX } from "solid-js";

type Mode = "light" | "dark";

export default function ThemePicker(props: {
  moon: JSX.Element;
  sun: JSX.Element;
}) {
  const [mode, setMode] = createSignal<Mode>("light");
  const [preference, setPreference] = createSignal<Mode | "auto">("auto");
  const syncMode = () => {
    const root = document.documentElement;
    setMode(root.dataset.mode === "dark" ? "dark" : "light");
    const saved = root.dataset.modePreference;
    setPreference(saved === "light" || saved === "dark" ? saved : "auto");
  };

  onMount(() => {
    syncMode();
    window.addEventListener("modechange", syncMode);
    document.addEventListener("astro:page-load", syncMode);
    document.addEventListener("astro:after-swap", syncMode);
    onCleanup(() => {
      window.removeEventListener("modechange", syncMode);
      document.removeEventListener("astro:page-load", syncMode);
      document.removeEventListener("astro:after-swap", syncMode);
    });
  });

  const selectMode = (nextPreference: Mode | "auto") => {
    const nextMode =
      nextPreference === "auto"
        ? window.matchMedia("(prefers-color-scheme: dark)").matches
          ? "dark"
          : "light"
        : nextPreference;
    document.documentElement.dataset.modePreference = nextPreference;
    document.documentElement.dataset.mode = nextMode;
    try {
      localStorage.setItem("mode", nextPreference);
    } catch {
      /* Storage may be unavailable. */
    }
    window.dispatchEvent(
      new CustomEvent("modechange", { detail: { mode: nextMode } }),
    );
  };

  return (
    <div class="flex items-center">
      <button
        type="button"
        onClick={() => selectMode(mode() === "light" ? "dark" : "light")}
        class="inline-flex w-fit items-center justify-center p-2 rounded-lg cursor-pointer hover:bg-surface-1 focus-visible:outline-2 focus-visible:outline-offset-2"
        aria-label={`Switch to ${mode() === "light" ? "dark" : "light"} mode`}
        title={`Current mode: ${mode()}`}
      >
        <Show when={mode() === "light"} fallback={props.sun}>
          {props.moon}
        </Show>
      </button>
      <Show when={preference() !== "auto"}>
        <button
          type="button"
          onClick={() => selectMode("auto")}
          class="px-2 py-1 text-lg rounded-lg cursor-pointer hover:bg-surface-1 focus-visible:outline-2 focus-visible:outline-offset-2"
          aria-label="Use automatic color scheme"
          title="Follow system color scheme"
        >
          auto
        </button>
      </Show>
    </div>
  );
}
