--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8 (Homebrew)
-- Dumped by pg_dump version 16.8 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: pg_hint_plan; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_hint_plan WITH SCHEMA hint_plan;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: batch_samples; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.batch_samples (
    id bigint NOT NULL,
    batch_id bigint NOT NULL,
    sample_id character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: batch_samples_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.batch_samples_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: batch_samples_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.batch_samples_id_seq OWNED BY public.batch_samples.id;


--
-- Name: batches; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.batches (
    id bigint NOT NULL,
    batch_name character varying(255) NOT NULL,
    batch_description text,
    batch_code character varying(255) NOT NULL,
    source_location character varying(255) NOT NULL,
    destination_location character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    created_by character varying(255) NOT NULL,
    transferred_at timestamp(0) without time zone,
    cancelled_at timestamp(0) without time zone,
    completed_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    total_sample integer DEFAULT 0 NOT NULL,
    arrived_reason character varying(255)
);


--
-- Name: batches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.batches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: batches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.batches_id_seq OWNED BY public.batches.id;


--
-- Name: order_result_services; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_result_services (
    id bigint NOT NULL,
    order_id character varying(50) NOT NULL,
    test_result_id bigint,
    pkg_test_code character varying(100),
    parent_grp_test_code character varying(100),
    grp_test_code character varying(100),
    inv_test_code character varying(100) NOT NULL,
    test_status character varying(100) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    pkg_test_name character varying(255),
    parent_grp_test_name character varying(255),
    grp_test_name character varying(255),
    group_component text
);


--
-- Name: order_result_services_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.order_result_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_result_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.order_result_services_id_seq OWNED BY public.order_result_services.id;


--
-- Name: order_samples; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_samples (
    order_id character varying(50) NOT NULL,
    sample_id character varying(50) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    sample_status character varying(100),
    sample_collected_by character varying(100),
    sample_collected_time timestamp(6) without time zone,
    sample_received_by character varying(100),
    sample_received_time timestamp(6) without time zone,
    transferred_by character varying(100),
    transferred_time timestamp(6) without time zone,
    sample_name character varying(150),
    sample_container_name character varying(150),
    sample_generated_by text,
    sample_generated_time timestamp(0) without time zone,
    test_details json,
    sample_arrived_time timestamp(0) without time zone,
    sample_arrived_by character varying(255),
    sample_sorted_time timestamp(0) without time zone,
    sample_sorted_by character varying(255),
    sample_checked_time timestamp(0) without time zone,
    sample_checked_by character varying(255),
    print_count integer DEFAULT 0 NOT NULL,
    sample_missed_reason character varying(255),
    num_of_label integer DEFAULT 1 NOT NULL,
    is_recollect boolean DEFAULT false NOT NULL,
    sample_sent_to_outsource_time timestamp(0) without time zone,
    sample_sent_outsource_by character varying(255),
    sample_collected_location character varying(100),
    sample_received_to_checked_reason character varying(255),
    sample_canceled_by character varying(255),
    sample_canceled_time timestamp(0) without time zone,
    recollect_reason character varying(255),
    external_sample_id character varying(50),
    stat_sid boolean
);


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    order_id character varying(50) NOT NULL,
    account_code character varying(50) NOT NULL,
    patient_id character varying(50) NOT NULL,
    patient_name character varying(100) NOT NULL,
    patient_gender character varying(50) NOT NULL,
    patient_dob timestamp(0) without time zone NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    register_location character varying(50),
    ordered_date timestamp(0) without time zone,
    recollecting_flag boolean DEFAULT false NOT NULL,
    patient_mobile_number character varying(20),
    patient_info json,
    patient_visit_info json,
    customer_segment_id bigint,
    is_approved boolean DEFAULT false NOT NULL,
    source_type character varying(255),
    prevent_update_to timestamp(0) without time zone,
    status character varying(255),
    order_test_codes json,
    cancel_test_codes json,
    clone_order_id character varying(50),
    patient_info_last_updated_at timestamp(0) without time zone,
    stat boolean
);


--
-- Name: test_result_status_changes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.test_result_status_changes (
    id bigint NOT NULL,
    order_id character varying(50) NOT NULL,
    test_result_id bigint NOT NULL,
    new_test_result_id bigint,
    from_status character varying(255) NOT NULL,
    to_status character varying(255) NOT NULL,
    reason text,
    status_changed_by character varying(255) NOT NULL,
    status_changed_at timestamp(0) without time zone NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    value text,
    previous json
);


--
-- Name: test_result_status_changes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.test_result_status_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: test_result_status_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.test_result_status_changes_id_seq OWNED BY public.test_result_status_changes.id;


--
-- Name: test_results; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.test_results (
    id bigint NOT NULL,
    order_id character varying(50),
    patient_id character varying(50),
    test_code character varying(50),
    sample_id character varying(50) NOT NULL,
    test_status character varying(255) NOT NULL,
    processing_status character varying(255),
    device_code character varying(50),
    device_name character varying(50),
    lab_machine_test_code character varying(50),
    version character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    technical_remarks text,
    raw_test_value text,
    raw_unit character varying(255),
    raw_medical_remarks text,
    raw_abnormal character varying(255),
    started_capturing_at character varying(255),
    raw_extra json,
    final_test_value character varying(255),
    final_medical_remarks text,
    final_is_abnormal boolean,
    raw_reference_range json,
    sample_collected_by character varying(150),
    sample_collected_location character varying(150),
    sample_collected_time timestamp(0) without time zone,
    sample_completed_time timestamp(0) without time zone,
    sample_rejected_time timestamp(0) without time zone,
    result_captured_at timestamp(0) without time zone,
    test_name_en text,
    test_name_vi text,
    billing_name text,
    method_name text,
    sample_name character varying(50),
    conversion_unit character varying(50),
    interpretation_note text,
    section_order_position integer,
    sub_section_order_position integer,
    primary_unit character varying(50),
    test_code_section character varying(100),
    final_ref_range_type character varying(50),
    final_auto_authorized boolean DEFAULT false NOT NULL,
    device_id character varying(50),
    device_search_code character varying(20),
    recollect_reason text,
    rerun_reason text,
    retest_flag boolean DEFAULT false NOT NULL,
    formula text,
    formula_params json,
    final_conversion_data json,
    final_reference_range text,
    sample_transfer_time timestamp(0) without time zone,
    sample_transfer_by character varying(255),
    sample_received_time timestamp(0) without time zone,
    sample_received_by character varying(255),
    sample_received_location character varying(255),
    sample_reject_by character varying(255),
    result_approved_at timestamp(0) without time zone,
    result_captured_by character varying(255),
    result_approved_by character varying(255),
    interpretation_note_vi text,
    non_reportable character varying(10) DEFAULT 'Y'::character varying NOT NULL,
    generate_draft_pdf boolean DEFAULT true NOT NULL,
    intra_section_sq character varying(255),
    group_component text,
    laboratory character varying(255),
    sample_completed_by character varying(150),
    recollect_test_result_id bigint,
    is_rerun boolean DEFAULT false NOT NULL,
    nature_of_abnormal_result character varying(255),
    is_recall boolean,
    reviewing_reason text,
    recheck_reason text,
    is_poct boolean DEFAULT false,
    sample_canceled_by character varying(255),
    sample_canceled_time timestamp(0) without time zone,
    external_sample_id character varying(50)
);


--
-- Name: test_results_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.test_results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: test_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.test_results_id_seq OWNED BY public.test_results.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: batch_samples id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batch_samples ALTER COLUMN id SET DEFAULT nextval('public.batch_samples_id_seq'::regclass);


--
-- Name: batches id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batches ALTER COLUMN id SET DEFAULT nextval('public.batches_id_seq'::regclass);


--
-- Name: order_result_services id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_result_services ALTER COLUMN id SET DEFAULT nextval('public.order_result_services_id_seq'::regclass);


--
-- Name: test_result_status_changes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.test_result_status_changes ALTER COLUMN id SET DEFAULT nextval('public.test_result_status_changes_id_seq'::regclass);


--
-- Name: test_results id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.test_results ALTER COLUMN id SET DEFAULT nextval('public.test_results_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: batch_samples batch_samples_batch_id_sample_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batch_samples
    ADD CONSTRAINT batch_samples_batch_id_sample_id_unique UNIQUE (batch_id, sample_id);


--
-- Name: batch_samples batch_samples_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batch_samples
    ADD CONSTRAINT batch_samples_pkey PRIMARY KEY (id);


--
-- Name: batches batches_batch_code_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batches
    ADD CONSTRAINT batches_batch_code_unique UNIQUE (batch_code);


--
-- Name: batches batches_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batches
    ADD CONSTRAINT batches_pkey PRIMARY KEY (id);


--
-- Name: order_result_services order_result_services_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_result_services
    ADD CONSTRAINT order_result_services_pkey PRIMARY KEY (id);


--
-- Name: order_samples order_samples_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_samples
    ADD CONSTRAINT order_samples_pkey PRIMARY KEY (order_id, sample_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: test_result_status_changes test_result_status_changes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.test_result_status_changes
    ADD CONSTRAINT test_result_status_changes_pkey PRIMARY KEY (id);


--
-- Name: test_results test_results_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.test_results
    ADD CONSTRAINT test_results_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: count_todo_o2_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX count_todo_o2_idx ON public.orders USING btree (date(ordered_date));


--
-- Name: count_todo_o_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX count_todo_o_idx ON public.orders USING btree (ordered_date) INCLUDE (order_id) WHERE ((source_type)::text = 'LIS_API'::text);


--
-- Name: count_todo_tr_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX count_todo_tr_idx ON public.test_results USING btree (test_status, test_code_section, test_code, sample_received_time) INCLUDE (order_id, sample_id, sample_completed_time);


--
-- Name: count_todo_tr_test_code_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX count_todo_tr_test_code_idx ON public.test_results USING btree (test_code, test_status, sample_received_time) INCLUDE (order_id, sample_id, sample_completed_time) WHERE (sample_received_time IS NOT NULL);


--
-- Name: idx_os_sample_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_os_sample_id ON public.order_samples USING btree (sample_id);


--
-- Name: idx_os_tat_alert_scan; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_os_tat_alert_scan ON public.order_samples USING btree (sample_status) INCLUDE (sample_sorted_time, sample_id, order_id, sample_sent_to_outsource_time, sample_status) WHERE ((sample_status)::text = ANY ((ARRAY['SampleSorted'::character varying, 'Received'::character varying, 'SentToOutsource'::character varying])::text[]));


--
-- Name: idx_tat_alert_scan; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tat_alert_scan ON public.test_results USING btree (updated_at) INCLUDE (id, order_id, sample_id, test_code, test_code_section, test_name_en, test_name_vi, test_status, sample_received_time, result_captured_at, sample_completed_time, sample_collected_location, laboratory) WHERE ((order_id IS NOT NULL) AND ((test_status)::text <> ALL ((ARRAY['approved'::character varying, 'recollect'::character varying, 'cancel'::character varying])::text[])));


--
-- Name: idx_tr_status_changes_order_id_test_result_id_status_changed_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tr_status_changes_order_id_test_result_id_status_changed_at ON public.test_result_status_changes USING btree (order_id, test_result_id, status_changed_at DESC);


--
-- Name: idx_tr_tat_alert_test; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tr_tat_alert_test ON public.test_results USING btree (test_status, updated_at) INCLUDE (order_id, sample_id) WHERE ((order_id IS NOT NULL) AND ((test_status)::text <> ALL ((ARRAY['approved'::character varying, 'recollect'::character varying, 'cancel'::character varying])::text[])));


--
-- Name: idx_tr_test; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tr_test ON public.test_results USING btree (updated_at, test_status) INCLUDE (sample_id, order_id);


--
-- Name: labtech_todo_test_results_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX labtech_todo_test_results_idx ON public.test_results USING btree (sample_received_time, test_code_section, test_status) WHERE (sample_received_time IS NOT NULL);


--
-- Name: order_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX order_id_index ON public.orders USING btree (order_id);


--
-- Name: order_result_services_order_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX order_result_services_order_id_index ON public.order_result_services USING btree (order_id);


--
-- Name: order_result_services_test_result_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX order_result_services_test_result_id_index ON public.order_result_services USING btree (test_result_id);


--
-- Name: order_result_services_updated_at_order_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX order_result_services_updated_at_order_id_index ON public.order_result_services USING btree (updated_at, order_id);


--
-- Name: order_samples_external_sample_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX order_samples_external_sample_id_index ON public.order_samples USING btree (external_sample_id);


--
-- Name: order_samples_order_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX order_samples_order_id_index ON public.order_samples USING btree (order_id);


--
-- Name: order_source_type_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX order_source_type_index ON public.orders USING btree (source_type);


--
-- Name: orders_ordered_date_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX orders_ordered_date_index ON public.orders USING btree (ordered_date);


--
-- Name: ors_grp_test_code_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ors_grp_test_code_idx ON public.order_result_services USING btree (grp_test_code) INCLUDE (test_result_id, order_id, pkg_test_code, parent_grp_test_name, grp_test_name) WHERE (grp_test_code IS NOT NULL);


--
-- Name: ors_inv_test_code_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ors_inv_test_code_idx ON public.order_result_services USING btree (inv_test_code) INCLUDE (test_result_id, order_id, pkg_test_code, parent_grp_test_name, grp_test_name) WHERE (inv_test_code IS NOT NULL);


--
-- Name: ors_parent_grp_test_code_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ors_parent_grp_test_code_idx ON public.order_result_services USING btree (parent_grp_test_code) INCLUDE (test_result_id, order_id, pkg_test_code, parent_grp_test_name, grp_test_name) WHERE (parent_grp_test_code IS NOT NULL);


--
-- Name: outsource_test_os_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX outsource_test_os_idx ON public.order_samples USING btree (sample_status, created_at) INCLUDE (sample_id, order_id, sample_sorted_time);


--
-- Name: outsource_test_tr_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX outsource_test_tr_idx ON public.test_results USING btree (test_status) INCLUDE (sample_id) WHERE ((order_id IS NOT NULL) AND ((laboratory)::text <> 'Diag'::text));


--
-- Name: pending_list_order_source_type_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pending_list_order_source_type_idx ON public.orders USING btree (order_id, source_type) WHERE (source_type IS NOT NULL);


--
-- Name: pending_list_tr_update_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pending_list_tr_update_at_idx ON public.test_results USING btree (updated_at);


--
-- Name: result_approved_at_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX result_approved_at_index ON public.test_results USING btree (result_approved_at);


--
-- Name: test_results_order_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX test_results_order_id_index ON public.test_results USING btree (order_id);


--
-- Name: test_results_sample_completed_time_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX test_results_sample_completed_time_index ON public.test_results USING btree (sample_completed_time);


--
-- Name: test_results_sample_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX test_results_sample_id_index ON public.test_results USING btree (sample_id);


--
-- Name: test_results_sample_id_lab_machine_test_code_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX test_results_sample_id_lab_machine_test_code_index ON public.test_results USING btree (sample_id, lab_machine_test_code);


--
-- Name: tr_analyzer_test_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tr_analyzer_test_idx ON public.test_results USING btree (device_search_code, test_code_section) WHERE (order_id IS NOT NULL);


--
-- PostgreSQL database dump complete
--

