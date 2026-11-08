void peephole_optimize(Instruction* head) {
    Instruction* current = head;
    while (current != NULL) {
        // Look for: add rd, rs, rt where rt is zero and rd == rs
        if (strcmp(current->op, "add") == 0 && 
            strcmp(current->rt, "$zero") == 0 && 
            strcmp(current->rd, current->rs) == 0) {
            
            // Unlink current redundant node from assembly chain
            Instruction* redundant = current;
            current = current->next;
            remove_instruction_node(redundant); 
            continue;
        }
        current = current->next;
    }
}
