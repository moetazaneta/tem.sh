/** @jsxImportSource react */
import { useId, useRef, useState } from "react";
import { AnimatePresence, LayoutGroup, motion, useReducedMotion } from "motion/react";
import "./button-morping-into-popup.css";

export function ButtonMorpingIntoPopup() {
  const [open, setOpen] = useState(false);
  const dialog = useRef<HTMLDialogElement>(null);
  const trigger = useRef<HTMLButtonElement>(null);
  const id = useId();
  const reducedMotion = useReducedMotion();
  const transition = { duration: reducedMotion ? 0 : 0.48, ease: [0.22, 1, 0.36, 1] as const };

  function showPopup() {
    dialog.current?.showModal();
    setOpen(true);
  }

  function finishClosing() {
    if (open) return;
    dialog.current?.close();
    trigger.current?.focus({ preventScroll: true });
  }

  return (
    <LayoutGroup id={id}>
      <div className="morph-demo">
        <motion.button
          ref={trigger}
          type="button"
          className="morph-trigger"
          layoutId="surface"
          transition={transition}
          style={{ borderRadius: 28, visibility: open ? "hidden" : "visible" }}
          aria-haspopup="dialog"
          aria-expanded={open}
          aria-controls={`${id}-dialog`}
          onClick={showPopup}
        >
          <motion.span layoutId="title" transition={transition}>a little more</motion.span>
        </motion.button>
      </div>

      <dialog
        ref={dialog}
        id={`${id}-dialog`}
        className="morph-dialog"
        aria-labelledby={`${id}-title`}
        aria-describedby={`${id}-description`}
        onCancel={(event) => { event.preventDefault(); setOpen(false); }}
      >
        <AnimatePresence onExitComplete={finishClosing}>
          {open && (
            <motion.div
              key="popup"
              className="morph-overlay"
              layoutRoot
              initial={{ backgroundColor: "rgba(0, 0, 0, 0)" }}
              animate={{ backgroundColor: "rgba(0, 0, 0, 0.22)" }}
              exit={{ backgroundColor: "rgba(0, 0, 0, 0)" }}
              transition={transition}
              onClick={(event) => { if (event.target === event.currentTarget) setOpen(false); }}
            >
              <motion.section
                className="morph-popup"
                layoutId="surface"
                style={{ borderRadius: 16 }}
                transition={transition}
              >
                <motion.h2 id={`${id}-title`} layoutId="title" transition={transition}>
                  a little more
                </motion.h2>
                <motion.div
                  initial={{ opacity: 0, y: reducedMotion ? 0 : 8 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: 0 }}
                  transition={{ duration: reducedMotion ? 0 : 0.18, delay: reducedMotion ? 0 : 0.12 }}
                >
                  <p id={`${id}-description`}>
                    A small button with room for a few more words. Close this window and everything folds back into place.
                  </p>
                  <button className="morph-close" type="button" autoFocus onClick={() => setOpen(false)}>
                    close popup <span aria-hidden="true">↗</span>
                  </button>
                </motion.div>
              </motion.section>
            </motion.div>
          )}
        </AnimatePresence>
      </dialog>
    </LayoutGroup>
  );
}
