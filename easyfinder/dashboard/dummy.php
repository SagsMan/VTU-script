if (
            $this->data = parent::$db->run_select(
                'SELECT * FROM plan_types WHERE network_id  = ?',
                [$network_id]
            )
        ) {
            return json_encode($this->data);
        }