//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

namespace PP.WaiMai.Model
{
	public partial class Recharge
	{
		public Recharge ToPOCO(bool isPOCO = true){
			return new Recharge(){
				RechargeID = this.RechargeID,
				AccountID = this.AccountID,
				Amount = this.Amount,
				Status = this.Status,
				IsDel = this.IsDel,
			};
		}
	}
}
