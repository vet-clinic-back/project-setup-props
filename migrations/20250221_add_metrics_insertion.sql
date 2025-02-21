-- 20250221_add_metrics_insertion.sql

-- Вставка данных в таблицу metrics
INSERT INTO metrics 
    (pulse, temperature, loadcell_output1, loadcell_output2, muscleactivity_output1, muscleactivity_output2, device_id)
VALUES 
    ($1, $2, $3, $4, $5, $6, $7);
