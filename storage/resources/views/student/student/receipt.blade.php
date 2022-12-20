<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>{{ $pageTitle }}</title>

		<style>
			.invoice-box {
				max-width: 800px;
				margin: auto;
				padding: 30px;
				border: 1px solid #eee;
				box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
				font-size: 16px;
				line-height: 24px;
				font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
				color: #555;
			}

			.invoice-box table {
				width: 100%;
				line-height: inherit;
				text-align: left;
			}

			.invoice-box table td {
				padding: 5px;
				vertical-align: top;
			}

			.invoice-box table tr td:nth-child(2) {
				text-align: right;
			}

			.invoice-box table tr.top table td {
				padding-bottom: 20px;
			}

			.invoice-box table tr.top table td.title {
				font-size: 45px;
				line-height: 45px;
				color: #333;
			}

			.invoice-box table tr.information table td {
				padding-bottom: 40px;
			}

			.invoice-box table tr.heading td {
				background: #eee;
				border-bottom: 1px solid #ddd;
				font-weight: bold;
			}

			.invoice-box table tr.details td {
				padding-bottom: 20px;
			}

			.invoice-box table tr.item td {
				border-bottom: 1px solid #eee;
			}

			.invoice-box table tr.item.last td {
				border-bottom: none;
			}

			.invoice-box table tr.total td:nth-child(2) {
				border-top: 2px solid #eee;
				font-weight: bold;
			}

			@media only screen and (max-width: 600px) {
				.invoice-box table tr.top table td {
					width: 100%;
					display: block;
					text-align: center;
				}

				.invoice-box table tr.information table td {
					width: 100%;
					display: block;
					text-align: center;
				}
			}

			/** RTL **/
			.invoice-box.rtl {
				direction: rtl;
				font-family: Tahoma, 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
			}

			.invoice-box.rtl table {
				text-align: right;
			}

			.invoice-box.rtl table tr td:nth-child(2) {
				text-align: left;
			}
			.btn-primary, .btn-primary:hover, .btn-primary:focus, .btn-primary:active, .btn-primary.active, .open>.dropdown-toggle.btn-primary {
    background-color: #a9cf45 !important;
    border-color: #a9cf45 !important;
	color: #fff;
	text-decoration: none;
}
.btn-primary, .btn-primary.disabled {
    box-shadow: 0 2px 6px #acb5f6;
}
.btn {
    font-weight: 600;
    line-height: 24px;
    letter-spacing: .5px;
}
.btn-group-sm>.btn, .btn-sm {
    border-radius: 0.2rem;
}
.btn.btn-sm {
    padding: 0.1rem 0.4rem;
    font-size: 18px;
}
		</style>
	</head>

	<body>
		<div class="invoice-box" id="receiptid" style="background: #fff;">
			<table cellpadding="0" cellspacing="0">
				<tr class="top">
					<td colspan="2">
						<table>
							<tr>
								<td class="title">
									<img src="{{ url('/') }}/usermedia/logo-1-1536x379.png" style="width: 100%; max-width: 300px" />
								</td>

								<td>
									Invoice #: {{ $receipt->id }}<br />
									Created: {{  showDate('d/M/Y',$receipt->created_at) }}<br />
									Payment Status:  @php  if($receipt->payment_status == 1):  @endphp
                                    <span class="color bg-success text-white pl-3 pr-3">{{  __lang('paid')  }}</span>
                             @php  else:  @endphp
                             <span class="color bg-danger text-white pl-3 pr-3">{{  __lang('failed')  }}</div>
                                 @php  endif;  @endphp
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr class="information">
					<td colspan="2">
						<table>
							<tr>
								<td>
									{!! html_entity_decode($general_address->value) !!}
								</td>

								<td>
									{{ " ".$session_name. " Session - ".$semester_name }}<br />
									{{ $user->name.' '.$user->last_name }}<br />
									{{ $user->email }}
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr class="heading">
					<td>Payment Method</td>

					<td></td>
				</tr>

				<tr class="details">
					<td>{{ $receipt->payment_method }}</td>

					<td></td>
				</tr>

				<tr class="heading">
					<td>Item</td>

					<td>Price</td>
				</tr>

				<tr class="item">
					@foreach($fee_name as $fee_name)
					<td>{{ $fee_name->name }}</td>
					@endforeach

					<td>{{formatCurrency($receipt->amount,$receipt->currency->country->currency_code)}}</td>
				</tr>
@php
    $charge = $receipt->total_amount - $receipt->amount;
@endphp
				<tr class="total">
					<td></td>

					<td>Payment Gateway Fee: {{formatCurrency($charge,$receipt->currency->country->currency_code)}}</td>
				</tr>
                <tr class="total">
					<td></td>

					<td>Total: {{formatCurrency($receipt->total_amount,$receipt->currency->country->currency_code)}}</td>
				</tr>
			</table>
			
		</div>
		<div style="text-align: center;margin:auto;margin-top: 30px;">
			<a href="#" onClick="printStudent('receiptid');" class="btn btn-sm btn-shadow btn-primary">PRINT</a>
		</div>
	</body>
	
</html>
<script type="text/javascript" src="{{ url('/') }}/client/themes/admin/assets/modules/jquery.min.js"></script>
	<script type="text/javascript" >
		function printStudent(el){
var restorepage = $('body').html();
var printcontent = $('#' + el).clone();
$('body').empty().html(printcontent);
window.print();
$('body').html(restorepage);
}
	</script>

