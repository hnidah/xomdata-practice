-- Xom Data · Devices ready for dispatch
-- Problem: https://xomdata.com/practice/easy-not-001
-- Solved: 2026-10-14

-- Write your SQL here
SELECT
  device_code,
  status
FROM
  devices
WHERE
  status NOT IN ('Maintenance')
