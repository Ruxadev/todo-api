# Execution Plan: todo-api

This document outlines the development plan, progress, and next steps for the `todo-api` project, the Rails backend for the `vue-todo-app`.

## Phase 1: API Scaffolding (Complete)

- [x] Initialize a new Rails API-only application.
- [x] Establish Git repository and initial project structure.

## Phase 2: Location Resource (Complete)

- [x] Generate `Location` model (`name:string`).
- [x] Apply database migration for `locations` table.
- [x] Define RESTful routes for the `locations` resource under `/api/v1`.
- [x] Generate `Api::V1::LocationsController`.
- [x] Implement full CRUD actions (`index`, `show`, `create`, `update`, `destroy`) for `LocationsController`.

## Phase 3: Todo Resource (Complete)

- [x] Generate `Todo` model (`title:string`, `completed:boolean`) with a `belongs_to` association to `Location`.
- [x] Apply database migration for `todos` table, including the `location_id` foreign key.
- [x] Define nested RESTful routes for `todos` within `locations`.
- [x] Generate `Api::V1::TodosController`.
- [x] Implement full CRUD actions (`index`, `show`, `create`, `update`, `destroy`) for `TodosController`, scoped to the parent location.

## Current Status

**We have just completed Phase 3.** The backend API is now functionally complete for both `Location` and `Todo` resources. It provides a full suite of RESTful JSON endpoints for managing the data.

## Phase 4: Refinements & Next Steps

This phase focuses on small improvements to the backend and the major task of integrating the frontend.

- [ ] **Next Immediate Step:** Add `has_many :todos` to the `Location` model for associational clarity and completeness.
- [ ] **Configure CORS:** Modify `config/initializers/cors.rb` to allow the Vue.js frontend application (running on a different domain/port) to make requests to this API.
- [ ] **Frontend Integration:** Switch focus to the `vue-todo-app` project.
  - [ ] Install an HTTP client (e.g., `axios`).
  - [ ] Create an API service module to handle all communication with the Rails backend.
  - [ ] Replace all Local Storage logic with live API calls for all CRUD operations.
  - [ ] Update the UI to handle loading states, API errors, and asynchronous operations.
