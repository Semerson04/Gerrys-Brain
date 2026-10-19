<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerry's Brain - Byrne Building Services, Naas</title>
    <style>
        :root {
            --primary: #1e3a8a;
            --primary-dark: #1e293b;
            --accent: #0284c7;
            --danger: #dc2626;
            --danger-bg: #fee2e2;
            --success: #16a34a;
            --success-bg: #dcfce7;
            --bg: #f8fafc;
            --card-bg: #ffffff;
            --text: #334155;
            --text-light: #64748b;
            --border: #cbd5e1;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }

        body {
            background-color: var(--bg);
            color: var(--text);
            padding-bottom: 70px;
        }

        header {
            background-color: var(--primary);
            color: white;
            padding: 1rem;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        header h1 {
            font-size: 1.25rem;
            font-weight: 700;
        }

        header p {
            font-size: 0.85rem;
            opacity: 0.85;
            margin-top: 0.2rem;
        }

        .container {
            max-width: 600px;
            margin: 1rem auto;
            padding: 0 1rem;
        }

        /* Tabs Navigation */
        .nav-tabs {
            display: flex;
            background: white;
            border-bottom: 1px solid var(--border);
            position: sticky;
            top: 0;
            z-index: 100;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
        }

        .nav-tab {
            flex: 1;
            padding: 0.75rem 0.5rem;
            text-align: center;
            background: none;
            border: none;
            font-size: 0.9rem;
            font-weight: 600;
            color: var(--text-light);
            cursor: pointer;
            transition: all 0.2s;
        }

        .nav-tab.active {
            color: var(--primary);
            border-bottom: 3px solid var(--primary);
            background: #f1f5f9;
        }

        .view-section {
            display: none;
        }

        .view-section.active {
            display: block;
        }

        /* Cards & UI Elements */
        .card {
            background: var(--card-bg);
            border-radius: 8px;
            padding: 1rem;
            margin-bottom: 1rem;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            border: 1px solid var(--border);
            position: relative;
        }

        .card.alert {
            border-color: var(--danger);
            background-color: #fffefd;
        }

        .badge {
            display: inline-block;
            padding: 0.2rem 0.5rem;
            font-size: 0.75rem;
            font-weight: 600;
            border-radius: 4px;
            text-transform: uppercase;
        }

        .badge-danger {
            background-color: var(--danger-bg);
            color: var(--danger);
        }

        .badge-success {
            background-color: var(--success-bg);
            color: var(--success);
        }

        /* Forms */
        form label {
            display: block;
            font-size: 0.85rem;
            font-weight: 600;
            margin-bottom: 0.3rem;
            color: var(--text);
        }

        form input, form select, form textarea {
            width: 100%;
            padding: 0.6rem;
            margin-bottom: 0.9rem;
            border: 1px solid var(--border);
            border-radius: 6px;
            font-size: 1rem;
            background: #fff;
        }

        form textarea {
            resize: vertical;
            height: 80px;
        }

        button.btn {
            background-color: var(--primary);
            color: white;
            border: none;
            width: 100%;
            padding: 0.75rem;
            font-size: 1rem;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.2s;
        }

        button.btn:active {
            background-color: var(--primary-dark);
        }

        button.btn-success {
            background-color: var(--success);
        }

        /* Metric Grid for Sandra's View */
        .metrics-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 0.75rem;
            margin-bottom: 1rem;
        }

        .metric-card {
            background: white;
            padding: 1rem;
            border-radius: 8px;
            border: 1px solid var(--border);
            text-align: center;
        }

        .metric-card h3 {
            font-size: 1.5rem;
            color: var(--primary);
            margin-bottom: 0.2rem;
        }

        .metric-card p {
            font-size: 0.8rem;
            color: var(--text-light);
            font-weight: 600;
        }

        .job-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 0.5rem;
        }

        .job-title {
            font-weight: 700;
            font-size: 1rem;
            color: var(--primary-dark);
        }

        .job-meta {
            font-size: 0.85rem;
            color: var(--text-light);
            margin-bottom: 0.5rem;
            line-height: 1.4;
        }

        .price-action-row {
            display: flex;
            gap: 0.5rem;
            margin-top: 0.75rem;
            align-items: center;
        }

        .price-action-row input {
            margin-bottom: 0;
            font-weight: bold;
        }

        .empty-state {
            text-align: center;
            padding: 2rem;
            color: var(--text-light);
            font-style: italic;
        }
    </style>
</head>
<body>

    <header>
        <h1>Gerry's Brain</h1>
        <p>Byrne Building Services • Naas</p>
    </header>

    <div class="nav-tabs">
        <button class="nav-tab active" onclick="switchView('office')">1. Office</button>
        <button class="nav-tab" onclick="switchView('gerry')">2. Gerry's Queue</button>
        <button class="nav-tab" onclick="switchView('sandra')">3. Sandra's Dashboard</button>
    </div>

    <div class="container">

        <!-- VIEW 1: OFFICE (Log Job) -->
        <div id="view-office" class="view-section active">
            <div class="card">
                <h2 style="font-size: 1.1rem; margin-bottom: 1rem; color: var(--primary-dark);">Log Finished Job</h2>
                <form id="jobForm" onsubmit="handleJobSubmit(event)">
                    <label for="customer">Customer / Site Name</label>
                    <input type="text" id="customer" required placeholder="e.g., Naas Industrial Estate Unit 4">

                    <label for="jobType">Job Type</label>
                    <select id="jobType" required>
                        <option value="Commercial Electrical">Commercial Electrical</option>
                        <option value="Commercial Plumbing">Commercial Plumbing</option>
                        <option value="Fit-Out Wiring">Fit-Out Wiring</option>
                        <option value="Emergency Repair">Emergency Repair</option>
                        <option value="Boiler Servicing / Pipework">Boiler Servicing / Pipework</option>
                    </select>

                    <label for="dateDone">Date Done</label>
                    <input type="date" id="dateDone" required>

                    <label for="hours">Labor Hours</label>
                    <input type="number" step="0.5" id="hours" required placeholder="e.g., 6">

                    <label for="materialsCost">Materials Cost (€)</label>
                    <input type="number" step="0.01" id="materialsCost" required placeholder="e.g., 250">

                    <label for="note">Job Note / Description</label>
                    <textarea id="note" placeholder="Replaced 3-phase distribution board and tested circuits."></textarea>

                    <button type="submit" class="btn">Log Job (Under 1 min)</button>
                </form>
            </div>
        </div>

        <!-- VIEW 2: GERRY (Pricing Queue) -->
        <div id="view-gerry" class="view-section">
            <div style="margin-bottom: 0.75rem;">
                <h2 style="font-size: 1.1rem; color: var(--primary-dark);">Pricing Queue</h2>
                <p style="font-size: 0.85rem; color: var(--text-light);">Oldest jobs first. Tap approve or adjust price instantly.</p>
            </div>
            <div id="gerryQueueContainer"></div>
        </div>

        <!-- VIEW 3: SANDRA (Overview & Cash Tied Up) -->
        <div id="view-sandra" class="view-section">
            <div class="metrics-grid">
                <div class="metric-card">
                    <h3 id="statTotalCash">€0</h3>
                    <p>Cash Tied Up (Pending)</p>
                </div>
                <div class="metric-card">
                    <h3 id="statAvgDays">0 days</h3>
                    <p>Avg Wait Time</p>
                </div>
            </div>

            <div style="margin-bottom: 0.75rem;">
                <h2 style="font-size: 1.1rem; color: var(--primary-dark);">Pipeline Monitor</h2>
                <p style="font-size: 0.85rem; color: var(--text-light);">Jobs waiting > 3 days are highlighted red.</p>
            </div>
            <div id="sandraDashboardContainer"></div>
        </div>

    </div>

    <script>
        // Initial Sample Data (8 Jobs with varying completion dates to show alerts)
        const defaultJobs = [
            {
                id: '1',
                customer: 'Kildare County Council Offices',
                jobType: 'Commercial Electrical',
                dateDone: '2026-03-20', // ~30 days ago
                hours: 12,
                materialsCost: 450,
                note: 'Emergency lighting overhaul in main corridor.',
                status: 'pending',
                suggestedPrice: 1650,
                currentPrice: 1650
            },
            {
                id: '2',
                customer: 'Naas Retail Park Unit 12',
                jobType: 'Commercial Plumbing',
                dateDone: '2026-03-28', // ~22 days ago
                hours: 8,
                materialsCost: 320,
                note: 'Fitted new commercial washroom lines.',
                status: 'pending',
                suggestedPrice: 1120,
                currentPrice: 1120
            },
            {
                id: '3',
                customer: 'Caragh Road Warehouse',
                jobType: 'Fit-Out Wiring',
                dateDone: '2026-04-05', // ~14 days ago
                hours: 16,
                materialsCost: 890,
                note: 'Sub-main run and high-bay LED installation.',
                status: 'pending',
                suggestedPrice: 2490,
                currentPrice: 2490
            },
            {
                id: '4',
                customer: 'Ballymore Eustace Water Treatment Plant (Sub)',
                jobType: 'Emergency Repair',
                dateDone: '2026-04-12', // ~7 days ago
                hours: 5,
                materialsCost: 150,
                note: 'Fixed tripped main breaker and tested insulation resistance.',
                status: 'pending',
                suggestedPrice: 650,
                currentPrice: 650
            },
            {
                id: '5',
                customer: 'Sallins Road Dental Clinic',
                jobType: 'Commercial Plumbing',
                dateDone: '2026-04-15', // ~4 days ago
                hours: 6,
                materialsCost: 210,
                note: 'Installed thermostatic mixing valves on surgeries.',
                status: 'pending',
                suggestedPrice: 810,
                currentPrice: 810
            },
            {
                id: '6',
                customer: 'Millennium Business Park Unit 3',
                jobType: 'Commercial Electrical',
                dateDone: '2026-04-17', // 2 days ago (Not red)
                hours: 4,
                materialsCost: 95,
                note: 'Added 4 double sockets to office boardroom.',
                status: 'pending',
                suggestedPrice: 435,
                currentPrice: 435
            },
            {
                id: '7',
                customer: 'Dublin Road Service Station',
                jobType: 'Boiler Servicing / Pipework',
                dateDone: '2026-04-18', // 1 day ago (Not red)
                hours: 3,
                materialsCost: 60,
                note: 'Annual commercial boiler safety check & emission test.',
                status: 'pending',
                suggestedPrice: 360,
                currentPrice: 360
            },
            {
                id: '8',
                customer: 'Craddockstown Business Campus',
                jobType: 'Fit-Out Wiring',
                dateDone: '2026-04-19', // Today
                hours: 10,
                materialsCost: 400,
                note: 'Data and power trunking run for new desks.',
                status: 'pending',
                suggestedPrice: 1400,
                currentPrice: 1400
            }
        ];

        // LocalStorage Initialization
        function getJobs() {
            const stored = localStorage.getItem('gerrys_brain_jobs');
            if (!stored) {
                localStorage.setItem('gerrys_brain_jobs', JSON.stringify(defaultJobs));
                return defaultJobs;
            }
            return JSON.parse(stored);
        }

        function saveJobs(jobs) {
            localStorage.setItem('gerrys_brain_jobs', JSON.stringify(jobs));
            renderAll();
        }

        // Set default date in Office form to today
        document.getElementById('dateDone').valueAsDate = new Date();

        // View Switcher
        function switchView(viewName) {
            document.querySelectorAll('.view-section').forEach(el => el.classList.remove('active'));
            document.querySelectorAll('.nav-tab').forEach(el => el.classList.remove('active'));

            if (viewName === 'office') {
                document.getElementById('view-office').classList.add('active');
                document.querySelectorAll('.nav-tab')[0].classList.add('active');
            } else if (viewName === 'gerry') {
                document.getElementById('view-gerry').classList.add('active');
                document.querySelectorAll('.nav-tab')[1].classList.add('active');
                renderGerryQueue();
            } else if (viewName === 'sandra') {
                document.getElementById('view-sandra').classList.add('active');
                document.querySelectorAll('.nav-tab')[2].classList.add('active');
                renderSandraDashboard();
            }
        }

        // Handle Office Form Submission
        function handleJobSubmit(e) {
            e.preventDefault();
            const customer = document.getElementById('customer').value;
            const jobType = document.getElementById('jobType').value;
            const dateDone = document.getElementById('dateDone').value;
            const hours = parseFloat(document.getElementById('hours').value);
            const materialsCost = parseFloat(document.getElementById('materialsCost').value);
            const note = document.getElementById('note').value;

            // Simple intelligent suggestion algorithm based on past rates (€65/hr + 20% markup on materials)
            const suggestedPrice = Math.round((hours * 65) + (materialsCost * 1.2));

            const newJob = {
                id: Date.now().toString(),
                customer,
                jobType,
                dateDone,
                hours,
                materialsCost,
                note,
                status: 'pending',
                suggestedPrice,
                currentPrice: suggestedPrice
            };

            const jobs = getJobs();
            jobs.push(newJob);
            saveJobs(jobs);

            // Reset form and switch to Gerry's queue so he sees it immediately
            document.getElementById('jobForm').reset();
            document.getElementById('dateDone').valueAsDate = new Date();
            alert('Job logged successfully and sent to Gerry!');
            switchView('gerry');
        }

        // Calculate days waiting
        function getDaysWaiting(dateDoneStr) {
            const done = new Date(dateDoneStr);
            const today = new Date();
            const diffTime = today - done;
            const diffDays = Math.floor(diffTime / (1000 * 60 * 60 * 24));
            return diffDays < 0 ? 0 : diffDays;
        }

        // Render Gerry's Queue (Oldest first)
        function renderGerryQueue() {
            const container = document.getElementById('gerryQueueContainer');
            const jobs = getJobs().filter(j => j.status === 'pending');

            // Sort by oldest date first
            jobs.sort((a, b) => new Date(a.dateDone) - new Date(b.dateDone));

            if (jobs.length === 0) {
                container.innerHTML = '<div class="empty-state">All caught up! No jobs waiting for pricing.</div>';
                return;
            }

            let html = '';
            jobs.forEach(job => {
                const days = getDaysWaiting(job.dateDone);
                const isAlert = days > 3;

                html += `
                    <div class="card ${isAlert ? 'alert' : ''}">
                        <div class="job-header">
                            <span class="job-title">${job.customer}</span>
                            ${isAlert ? `<span class="badge badge-danger">Waiting ${days} days</span>` : `<span class="badge" style="background:#e2e8f0; color:#475569;">Waiting ${days} days</span>`}
                        </div>
                        <div class="job-meta">
                            <strong>Type:</strong> ${job.jobType}<br>
                            <strong>Done:</strong> ${job.dateDone} (${job.hours} hrs, €${job.materialsCost} mats)<br>
                            <strong>Note:</strong> ${job.note || 'None'}
                        </div>
                        <div style="background: #f8fafc; padding: 0.6rem; border-radius: 6px; font-size: 0.85rem;">
                            <strong>Suggested Price:</strong> €${job.suggestedPrice}
                        </div>
                        <div class="price-action-row">
                            <input type="number" id="price_${job.id}" value="${job.currentPrice}" step="1" style="flex: 1;">
                            <button class="btn btn-success" style="flex: 1; padding: 0.6rem;" onclick="approveJob('${job.id}')">Approve Price</button>
                        </div>
                    </div>
                `;
            });
            container.innerHTML = html;
        }

        // Gerry approves or edits price with one tap
        function approveJob(id) {
            const inputVal = document.getElementById(`price_${id}`).value;
            const finalPrice = parseFloat(inputVal);

            if (isNaN(finalPrice)) {
                alert('Please enter a valid price');
                return;
            }

            const jobs = getJobs();
            const job = jobs.find(j => j.id === id);
            if (job) {
                job.status = 'priced';
                job.currentPrice = finalPrice;
                saveJobs(jobs);
                renderGerryQueue();
            }
        }

        // Render Sandra's Dashboard
        function renderSandraDashboard() {
            const jobs = getJobs().filter(j => j.status === 'pending');
            jobs.sort((a, b) => new Date(a.dateDone) - new Date(b.dateDone));

            let totalCash = 0;
            let totalDays = 0;

            jobs.forEach(j => {
                totalCash += j.currentPrice;
                totalDays += getDaysWaiting(j.dateDone);
            });

            const avgDays = jobs.length > 0 ? Math.round(totalDays / jobs.length) : 0;

            document.getElementById('statTotalCash').innerText = `€${totalCash.toLocaleString()}`;
            document.getElementById('statAvgDays').innerText = `${avgDays} days`;

            const container = document.getElementById('sandraDashboardContainer');

            if (jobs.length === 0) {
                container.innerHTML = '<div class="empty-state">No pending jobs in the queue. All invoices ready!</div>';
                return;
            }

            let html = '';
            jobs.forEach(job => {
                const days = getDaysWaiting(job.dateDone);
                const isAlert = days > 3;

                html += `
                    <div class="card ${isAlert ? 'alert' : ''}">
                        <div class="job-header">
                            <span class="job-title">${job.customer}</span>
                            ${isAlert ? `<span class="badge badge-danger">🔴 ${days} Days Waiting</span>` : `<span class="badge badge-success">🟢 ${days} Days</span>`}
                        </div>
                        <div class="job-meta">
                            <strong>Job Type:</strong> ${job.jobType}<br>
                            <strong>Date Done:</strong> ${job.dateDone}<br>
                            <strong>Estimated Value:</strong> €${job.currentPrice.toLocaleString()}<br>
                            <strong>Note:</strong> ${job.note || 'None'}
                        </div>
                    </div>
                `;
            });
            container.innerHTML = html;
        }

        function renderAll() {
            // Keep current view updated if active
            if (document.getElementById('view-gerry').classList.contains('active')) {
                renderGerryQueue();
            }
            if (document.getElementById('view-sandra').classList.contains('active')) {
                renderSandraDashboard();
            }
        }

        // Initial load
        renderAll();
    </script>
</body>
</html>
