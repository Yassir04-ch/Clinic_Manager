<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Patient | ClinicManager</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Segoe UI", Arial, sans-serif;
            min-height: 100vh;
            background: #f3f6fb;
            color: #1e293b;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 35px 20px;
        }

        .page-container {
            width: 100%;
            max-width: 900px;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 24px;
        }

        .brand-icon {
            width: 46px;
            height: 46px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 14px;
            background: #0f766e;
            color: white;
            font-size: 27px;
            font-weight: 700;
        }

        .brand h2 {
            font-size: 21px;
            font-weight: 750;
            letter-spacing: -0.5px;
        }

        .brand p {
            margin-top: 3px;
            color: #64748b;
            font-size: 13px;
        }

        .card {
            background: white;
            border: 1px solid #e5eaf2;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 12px 40px rgba(15, 23, 42, 0.06);
        }

        .card-header {
            padding: 30px 34px;
            background: linear-gradient(120deg, #ecfdf8, #f0fdfa);
            border-bottom: 1px solid #d9f2eb;
        }

        .card-header h1 {
            font-size: 27px;
            letter-spacing: -0.7px;
            color: #123b3a;
            margin-bottom: 8px;
        }

        .card-header p {
            color: #52716f;
            font-size: 14px;
            line-height: 1.6;
        }

        .form-body {
            padding: 32px 34px;
        }

        .section-title {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 15px;
            font-weight: 700;
            color: #334155;
            margin-bottom: 22px;
        }

        .section-number {
            width: 29px;
            height: 29px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background: #ccfbf1;
            color: #0f766e;
            border-radius: 9px;
            font-size: 13px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 21px 24px;
            margin-bottom: 32px;
        }

        .field {
            display: flex;
            flex-direction: column;
            gap: 8px;
            min-width: 0;
        }

        .field.full-width {
            grid-column: 1 / -1;
        }

        label {
            font-size: 13px;
            font-weight: 650;
            color: #334155;
        }

        .required {
            color: #dc2626;
        }

        input, select {
            width: 100%;
            height: 46px;
            border: 1px solid #dbe2ea;
            border-radius: 10px;
            background: #fff;
            padding: 0 13px;
            font-family: inherit;
            font-size: 14px;
            color: #1e293b;
            outline: none;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        input::placeholder {
            color: #a0aaba;
        }

        input:focus, select:focus {
            border-color: #0f9b8e;
            box-shadow: 0 0 0 3px rgba(15, 155, 142, 0.12);
        }

        .form-actions {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 12px;
            padding-top: 24px;
            border-top: 1px solid #edf0f5;
        }

        .btn {
            min-height: 45px;
            padding: 0 20px;
            border-radius: 10px;
            font-family: inherit;
            font-size: 14px;
            font-weight: 650;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: 0.2s ease;
        }

        .btn-cancel {
            background: white;
            color: #475569;
            border: 1px solid #dbe2ea;
        }

        .btn-cancel:hover {
            background: #f8fafc;
        }

        .btn-submit {
            background: #0f766e;
            color: white;
            border: 1px solid #0f766e;
        }

        .btn-submit:hover {
            background: #115e59;
            transform: translateY(-1px);
            box-shadow: 0 5px 12px rgba(15, 118, 110, 0.18);
        }

        .form-note {
            margin-top: 20px;
            color: #64748b;
            font-size: 12px;
        }

        @media (max-width: 600px) {
            body {
                padding: 20px 12px;
                align-items: flex-start;
            }

            .card-header, .form-body {
                padding: 24px 20px;
            }

            .card-header h1 {
                font-size: 23px;
            }

            .form-grid {
                grid-template-columns: 1fr;
                gap: 18px;
            }

            .field.full-width {
                grid-column: auto;
            }

            .form-actions {
                flex-direction: column-reverse;
            }

            .btn {
                width: 100%;
            }
        }
    </style>
</head>

<body>

<div class="page-container">

    <div class="brand">
        <div class="brand-icon">+</div>
        <div>
            <h2>ClinicManager</h2>
            <p>Healthcare management system</p>
        </div>
    </div>

    <div class="card">

        <div class="card-header">
            <h1>Create Patient</h1>
            <p>Register a new patient by completing the personal and medical profile information below.</p>
        </div>

        <form action="${pageContext.request.contextPath}/users/create" method="post">

            <input type="hidden" name="role" value="PATIENT">

            <div class="form-body">

                <div class="section-title">
                    <span class="section-number">01</span>
                    Personal Information
                </div>

                <div class="form-grid">

                    <div class="field">
                        <label for="firstName">First Name <span class="required">*</span></label>
                        <input type="text" id="firstName" name="firstName"
                               placeholder="Enter first name" autocomplete="given-name" required>
                    </div>

                    <div class="field">
                        <label for="lastName">Last Name <span class="required">*</span></label>
                        <input type="text" id="lastName" name="lastName"
                               placeholder="Enter last name" autocomplete="family-name" required>
                    </div>

                    <div class="field">
                        <label for="email">Email Address <span class="required">*</span></label>
                        <input type="email" id="email" name="email"
                               placeholder="patient@example.com" autocomplete="email" required>
                    </div>

                    <div class="field">
                        <label for="phone">Phone Number</label>
                        <input type="tel" id="phone" name="phone"
                               placeholder="Enter phone number" autocomplete="tel">
                    </div>

                    <div class="field">
                        <label for="password">Password <span class="required">*</span></label>
                        <input type="password" id="password" name="password"
                               placeholder="Create a password" autocomplete="new-password" required>
                    </div>

                    <div class="field">
                        <label for="cin">National ID (CIN) <span class="required">*</span></label>
                        <input type="text" id="cin" name="cin"
                               placeholder="Enter CIN" required>
                    </div>

                </div>

                <div class="section-title">
                    <span class="section-number">02</span>
                    Additional Information
                </div>

                <div class="form-grid">

                    <div class="field">
                        <label for="dateOfBirth">Date of Birth</label>
                        <input type="date" id="dateOfBirth" name="dateOfBirth">
                    </div>

                    <div class="field">
                        <label for="gender">Gender</label>
                        <select id="gender" name="gender">
                            <option value="">Select gender</option>
                            <option value="MALE">Male</option>
                            <option value="FEMALE">Female</option>
                        </select>
                    </div>

                    <div class="field full-width">
                        <label for="address">Address</label>
                        <input type="text" id="address" name="address"
                               placeholder="Street, city, postal code" autocomplete="street-address">
                    </div>

                </div>

                <div class="form-actions">
                    <button type="reset" class="btn btn-cancel">Reset Form</button>
                    <button type="submit" class="btn btn-submit">Create Patient &nbsp; →</button>
                </div>

                <p class="form-note">
                    Fields marked with <span class="required">*</span> are required.
                </p>

            </div>
        </form>
    </div>

</div>

</body>
</html>
