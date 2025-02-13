Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BB2201034
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Feb 2025 09:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739437392; cv=none; b=sxU9yHh03WuXkSwNgkMGcwT+nU4kFjvhqQxd/pe2i0wT9TW1iT6pagsFh7LtsNOqkh7dtwq7uJO2REcHyuWVMMT+JXuqb/d7eqzpu5tJFERt6GvuAPGJ9McKcpEoVH+N3mfU1ow3xuZQYdEydASQ/OYWE+noX0aMopF2/djnWX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739437392; c=relaxed/simple;
	bh=Qn1cs68iC6odQq0OKsTIicz17rUIHirGJWqJSowJtUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f/V+87ExmQjzv+r+m67H7CW0G5WXeSrin3p+kXOk6Yrr+8wE8sp0KSIdJNVz5ISV7ZxsZgSa+Jg1XeHOJ1EfsR4RUHFxlhFZmk8fdr88VgCvnj7Wm7x9cJP1xTP3r+TXG8CtYHTjqulIIj4Fj6cHfpP0DtEjQj5ohK2nLWXuFhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IG77EvU4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IG77EvU4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739437389; x=1770973389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qn1cs68iC6odQq0OKsTIicz17rUIHirGJWqJSowJtUo=;
  b=IG77EvU4BPAWdl7D83gObL/0tnWmylP77K/FeR49lB1AGSsH4GkJDDCG
   E5t+Y+ItTpoR4Fo2cCuuo35yhBIr+mkaei9EzsHx3SG0a0Zo+yb9CKHPg
   clQISHEcvEvn/fxkz0YTDfzwuIQRIyopP3MvnghU1i6ZvXEk+Ap/dowRI
   MVdUo7+XLAOvxOd8r+4dpPxORA5atK9DLXWk8beOO/DiVdZdZgyKKMEEd
   dz0E2znO/eepusQF+ujkx+HBGnQ62o+2W8oI2M1Y55dnBmPVM3nnHu6IG
   AL+bJaqBrWrxfdgC5rfUdm2VWZB6YhYuukFuFn8/4OJgOZY0ZHLN6Ruzh
   w==;
X-CSE-ConnectionGUID: /YJEPt4lRbOChsCV+tBoOA==
X-CSE-MsgGUID: sA8Q3azuSIi31ucisgoByA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="42964586"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="42964586"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 01:03:09 -0800
X-CSE-ConnectionGUID: xKrtDgvITeee3gypTqWjRg==
X-CSE-MsgGUID: vK/H7KGRSWWWzJPay2QT/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="112851162"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Feb 2025 01:03:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiV7g-0016qr-21;
	Thu, 13 Feb 2025 09:03:04 +0000
Date: Thu, 13 Feb 2025 17:02:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi:808.18-815.6: Warning
 (unit_address_vs_reg):
 /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/sbefifo@2400/occ: node has
 a reg or ranges property, but no unit name
Message-ID: <202502131648.Ra7ca3pO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Joel Stanley <joel@jms.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4dc1d1bec89864d8076e5ab314f86f46442bfb02
commit: 71354f7702c3b46f992c9f25c12af10123b76266 ARM: dts: aspeed: rainier: Reorganise FSI description
date:   1 year, 6 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 1 year, 6 months ago
config: arm-randconfig-004-20230928 (https://download.01.org/0day-ci/archive/20250213/202502131648.Ra7ca3pO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502131648.Ra7ca3pO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502131648.Ra7ca3pO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi:157.18-164.6: Warning (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi:322.18-329.6: Warning (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi:808.18-815.6: Warning (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi:1181.18-1188.6: Warning (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/sbefifo@2400/occ: node has a reg or ranges property, but no unit name

vim +808 arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi

fa9d3b8be23d02 Eddie James 2023-08-09   453  
fa9d3b8be23d02 Eddie James 2023-08-09   454  &fsi_hub0 {
fa9d3b8be23d02 Eddie James 2023-08-09   455  	cfam@2,0 {
fa9d3b8be23d02 Eddie James 2023-08-09   456  		reg = <2 0>;
fa9d3b8be23d02 Eddie James 2023-08-09   457  		#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   458  		#size-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   459  		chip-id = <2>;
fa9d3b8be23d02 Eddie James 2023-08-09   460  
fa9d3b8be23d02 Eddie James 2023-08-09   461  		scom@1000 {
fa9d3b8be23d02 Eddie James 2023-08-09   462  			compatible = "ibm,fsi2pib";
fa9d3b8be23d02 Eddie James 2023-08-09   463  			reg = <0x1000 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   464  		};
fa9d3b8be23d02 Eddie James 2023-08-09   465  
fa9d3b8be23d02 Eddie James 2023-08-09   466  		i2c@1800 {
fa9d3b8be23d02 Eddie James 2023-08-09   467  			compatible = "ibm,fsi-i2c-master";
fa9d3b8be23d02 Eddie James 2023-08-09   468  			reg = <0x1800 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   469  			#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   470  			#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   471  
fa9d3b8be23d02 Eddie James 2023-08-09   472  			cfam2_i2c0: i2c-bus@0 {
fa9d3b8be23d02 Eddie James 2023-08-09   473  				#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   474  				#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   475  				reg = <0>;	/* OM01 */
fa9d3b8be23d02 Eddie James 2023-08-09   476  
fa9d3b8be23d02 Eddie James 2023-08-09   477  				i2cr@20 {
fa9d3b8be23d02 Eddie James 2023-08-09   478  					compatible = "ibm,i2cr-fsi-master";
fa9d3b8be23d02 Eddie James 2023-08-09   479  					reg = <0x20>;
fa9d3b8be23d02 Eddie James 2023-08-09   480  					#address-cells = <2>;
fa9d3b8be23d02 Eddie James 2023-08-09   481  					#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   482  
fa9d3b8be23d02 Eddie James 2023-08-09   483  					cfam@0,0 {
fa9d3b8be23d02 Eddie James 2023-08-09   484  						reg = <0 0>;
fa9d3b8be23d02 Eddie James 2023-08-09   485  						#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   486  						#size-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   487  						chip-id = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   488  
fa9d3b8be23d02 Eddie James 2023-08-09   489  						scom300: scom@1000 {
fa9d3b8be23d02 Eddie James 2023-08-09   490  							compatible = "ibm,i2cr-scom";
fa9d3b8be23d02 Eddie James 2023-08-09   491  							reg = <0x1000 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   492  						};
fa9d3b8be23d02 Eddie James 2023-08-09   493  
fa9d3b8be23d02 Eddie James 2023-08-09   494  						sbefifo300: sbefifo@2400 {
fa9d3b8be23d02 Eddie James 2023-08-09   495  							compatible = "ibm,p9-sbefifo";
fa9d3b8be23d02 Eddie James 2023-08-09   496  							reg = <0x2400 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   497  							#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   498  							#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   499  						};
fa9d3b8be23d02 Eddie James 2023-08-09   500  					};
fa9d3b8be23d02 Eddie James 2023-08-09   501  				};
fa9d3b8be23d02 Eddie James 2023-08-09   502  			};
fa9d3b8be23d02 Eddie James 2023-08-09   503  
fa9d3b8be23d02 Eddie James 2023-08-09   504  			cfam2_i2c1: i2c-bus@1 {
fa9d3b8be23d02 Eddie James 2023-08-09   505  				#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   506  				#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   507  				reg = <1>;	/* OM23 */
fa9d3b8be23d02 Eddie James 2023-08-09   508  
fa9d3b8be23d02 Eddie James 2023-08-09   509  				i2cr@20 {
fa9d3b8be23d02 Eddie James 2023-08-09   510  					compatible = "ibm,i2cr-fsi-master";
fa9d3b8be23d02 Eddie James 2023-08-09   511  					reg = <0x20>;
fa9d3b8be23d02 Eddie James 2023-08-09   512  					#address-cells = <2>;
fa9d3b8be23d02 Eddie James 2023-08-09   513  					#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   514  
fa9d3b8be23d02 Eddie James 2023-08-09   515  					cfam@0,0 {
fa9d3b8be23d02 Eddie James 2023-08-09   516  						reg = <0 0>;
fa9d3b8be23d02 Eddie James 2023-08-09   517  						#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   518  						#size-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   519  						chip-id = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   520  
fa9d3b8be23d02 Eddie James 2023-08-09   521  						scom301: scom@1000 {
fa9d3b8be23d02 Eddie James 2023-08-09   522  							compatible = "ibm,i2cr-scom";
fa9d3b8be23d02 Eddie James 2023-08-09   523  							reg = <0x1000 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   524  						};
fa9d3b8be23d02 Eddie James 2023-08-09   525  
fa9d3b8be23d02 Eddie James 2023-08-09   526  						sbefifo301: sbefifo@2400 {
fa9d3b8be23d02 Eddie James 2023-08-09   527  							compatible = "ibm,p9-sbefifo";
fa9d3b8be23d02 Eddie James 2023-08-09   528  							reg = <0x2400 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   529  							#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   530  							#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   531  						};
fa9d3b8be23d02 Eddie James 2023-08-09   532  					};
fa9d3b8be23d02 Eddie James 2023-08-09   533  				};
fa9d3b8be23d02 Eddie James 2023-08-09   534  			};
fa9d3b8be23d02 Eddie James 2023-08-09   535  
fa9d3b8be23d02 Eddie James 2023-08-09   536  			cfam2_i2c10: i2c-bus@a {
fa9d3b8be23d02 Eddie James 2023-08-09   537  				#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   538  				#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   539  				reg = <10>;	/* OP3A */
fa9d3b8be23d02 Eddie James 2023-08-09   540  
fa9d3b8be23d02 Eddie James 2023-08-09   541  				i2cr@20 {
fa9d3b8be23d02 Eddie James 2023-08-09   542  					compatible = "ibm,i2cr-fsi-master";
fa9d3b8be23d02 Eddie James 2023-08-09   543  					reg = <0x20>;
fa9d3b8be23d02 Eddie James 2023-08-09   544  					#address-cells = <2>;
fa9d3b8be23d02 Eddie James 2023-08-09   545  					#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   546  
fa9d3b8be23d02 Eddie James 2023-08-09   547  					cfam@0,0 {
fa9d3b8be23d02 Eddie James 2023-08-09   548  						reg = <0 0>;
fa9d3b8be23d02 Eddie James 2023-08-09   549  						#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   550  						#size-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   551  						chip-id = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   552  
fa9d3b8be23d02 Eddie James 2023-08-09   553  						scom310: scom@1000 {
fa9d3b8be23d02 Eddie James 2023-08-09   554  							compatible = "ibm,i2cr-scom";
fa9d3b8be23d02 Eddie James 2023-08-09   555  							reg = <0x1000 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   556  						};
fa9d3b8be23d02 Eddie James 2023-08-09   557  
fa9d3b8be23d02 Eddie James 2023-08-09   558  						sbefifo310: sbefifo@2400 {
fa9d3b8be23d02 Eddie James 2023-08-09   559  							compatible = "ibm,p9-sbefifo";
fa9d3b8be23d02 Eddie James 2023-08-09   560  							reg = <0x2400 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   561  							#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   562  							#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   563  						};
fa9d3b8be23d02 Eddie James 2023-08-09   564  					};
fa9d3b8be23d02 Eddie James 2023-08-09   565  				};
fa9d3b8be23d02 Eddie James 2023-08-09   566  			};
fa9d3b8be23d02 Eddie James 2023-08-09   567  
fa9d3b8be23d02 Eddie James 2023-08-09   568  			cfam2_i2c11: i2c-bus@b {
fa9d3b8be23d02 Eddie James 2023-08-09   569  				#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   570  				#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   571  				reg = <11>;	/* OP3B */
fa9d3b8be23d02 Eddie James 2023-08-09   572  
fa9d3b8be23d02 Eddie James 2023-08-09   573  				i2cr@20 {
fa9d3b8be23d02 Eddie James 2023-08-09   574  					compatible = "ibm,i2cr-fsi-master";
fa9d3b8be23d02 Eddie James 2023-08-09   575  					reg = <0x20>;
fa9d3b8be23d02 Eddie James 2023-08-09   576  					#address-cells = <2>;
fa9d3b8be23d02 Eddie James 2023-08-09   577  					#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   578  
fa9d3b8be23d02 Eddie James 2023-08-09   579  					cfam@0,0 {
fa9d3b8be23d02 Eddie James 2023-08-09   580  						reg = <0 0>;
fa9d3b8be23d02 Eddie James 2023-08-09   581  						#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   582  						#size-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   583  						chip-id = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   584  
fa9d3b8be23d02 Eddie James 2023-08-09   585  						scom311: scom@1000 {
fa9d3b8be23d02 Eddie James 2023-08-09   586  							compatible = "ibm,i2cr-scom";
fa9d3b8be23d02 Eddie James 2023-08-09   587  							reg = <0x1000 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   588  						};
fa9d3b8be23d02 Eddie James 2023-08-09   589  
fa9d3b8be23d02 Eddie James 2023-08-09   590  						sbefifo311: sbefifo@2400 {
fa9d3b8be23d02 Eddie James 2023-08-09   591  							compatible = "ibm,p9-sbefifo";
fa9d3b8be23d02 Eddie James 2023-08-09   592  							reg = <0x2400 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   593  							#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   594  							#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   595  						};
fa9d3b8be23d02 Eddie James 2023-08-09   596  					};
fa9d3b8be23d02 Eddie James 2023-08-09   597  				};
fa9d3b8be23d02 Eddie James 2023-08-09   598  			};
fa9d3b8be23d02 Eddie James 2023-08-09   599  
fa9d3b8be23d02 Eddie James 2023-08-09   600  			cfam2_i2c12: i2c-bus@c {
fa9d3b8be23d02 Eddie James 2023-08-09   601  				#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   602  				#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   603  				reg = <12>;	/* OP4A */
fa9d3b8be23d02 Eddie James 2023-08-09   604  
fa9d3b8be23d02 Eddie James 2023-08-09   605  				i2cr@20 {
fa9d3b8be23d02 Eddie James 2023-08-09   606  					compatible = "ibm,i2cr-fsi-master";
fa9d3b8be23d02 Eddie James 2023-08-09   607  					reg = <0x20>;
fa9d3b8be23d02 Eddie James 2023-08-09   608  					#address-cells = <2>;
fa9d3b8be23d02 Eddie James 2023-08-09   609  					#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   610  
fa9d3b8be23d02 Eddie James 2023-08-09   611  					cfam@0,0 {
fa9d3b8be23d02 Eddie James 2023-08-09   612  						reg = <0 0>;
fa9d3b8be23d02 Eddie James 2023-08-09   613  						#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   614  						#size-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   615  						chip-id = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   616  
fa9d3b8be23d02 Eddie James 2023-08-09   617  						scom312: scom@1000 {
fa9d3b8be23d02 Eddie James 2023-08-09   618  							compatible = "ibm,i2cr-scom";
fa9d3b8be23d02 Eddie James 2023-08-09   619  							reg = <0x1000 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   620  						};
fa9d3b8be23d02 Eddie James 2023-08-09   621  
fa9d3b8be23d02 Eddie James 2023-08-09   622  						sbefifo312: sbefifo@2400 {
fa9d3b8be23d02 Eddie James 2023-08-09   623  							compatible = "ibm,p9-sbefifo";
fa9d3b8be23d02 Eddie James 2023-08-09   624  							reg = <0x2400 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   625  							#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   626  							#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   627  						};
fa9d3b8be23d02 Eddie James 2023-08-09   628  					};
fa9d3b8be23d02 Eddie James 2023-08-09   629  				};
fa9d3b8be23d02 Eddie James 2023-08-09   630  			};
fa9d3b8be23d02 Eddie James 2023-08-09   631  
fa9d3b8be23d02 Eddie James 2023-08-09   632  			cfam2_i2c13: i2c-bus@d {
fa9d3b8be23d02 Eddie James 2023-08-09   633  				#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   634  				#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   635  				reg = <13>;	/* OP4B */
fa9d3b8be23d02 Eddie James 2023-08-09   636  
fa9d3b8be23d02 Eddie James 2023-08-09   637  				i2cr@20 {
fa9d3b8be23d02 Eddie James 2023-08-09   638  					compatible = "ibm,i2cr-fsi-master";
fa9d3b8be23d02 Eddie James 2023-08-09   639  					reg = <0x20>;
fa9d3b8be23d02 Eddie James 2023-08-09   640  					#address-cells = <2>;
fa9d3b8be23d02 Eddie James 2023-08-09   641  					#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   642  
fa9d3b8be23d02 Eddie James 2023-08-09   643  					cfam@0,0 {
fa9d3b8be23d02 Eddie James 2023-08-09   644  						reg = <0 0>;
fa9d3b8be23d02 Eddie James 2023-08-09   645  						#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   646  						#size-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   647  						chip-id = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   648  
fa9d3b8be23d02 Eddie James 2023-08-09   649  						scom313: scom@1000 {
fa9d3b8be23d02 Eddie James 2023-08-09   650  							compatible = "ibm,i2cr-scom";
fa9d3b8be23d02 Eddie James 2023-08-09   651  							reg = <0x1000 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   652  						};
fa9d3b8be23d02 Eddie James 2023-08-09   653  
fa9d3b8be23d02 Eddie James 2023-08-09   654  						sbefifo313: sbefifo@2400 {
fa9d3b8be23d02 Eddie James 2023-08-09   655  							compatible = "ibm,p9-sbefifo";
fa9d3b8be23d02 Eddie James 2023-08-09   656  							reg = <0x2400 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   657  							#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   658  							#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   659  						};
fa9d3b8be23d02 Eddie James 2023-08-09   660  					};
fa9d3b8be23d02 Eddie James 2023-08-09   661  				};
fa9d3b8be23d02 Eddie James 2023-08-09   662  			};
fa9d3b8be23d02 Eddie James 2023-08-09   663  
fa9d3b8be23d02 Eddie James 2023-08-09   664  			cfam2_i2c14: i2c-bus@e {
fa9d3b8be23d02 Eddie James 2023-08-09   665  				#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   666  				#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   667  				reg = <14>;	/* OP5A */
fa9d3b8be23d02 Eddie James 2023-08-09   668  
fa9d3b8be23d02 Eddie James 2023-08-09   669  				i2cr@20 {
fa9d3b8be23d02 Eddie James 2023-08-09   670  					compatible = "ibm,i2cr-fsi-master";
fa9d3b8be23d02 Eddie James 2023-08-09   671  					reg = <0x20>;
fa9d3b8be23d02 Eddie James 2023-08-09   672  					#address-cells = <2>;
fa9d3b8be23d02 Eddie James 2023-08-09   673  					#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   674  
fa9d3b8be23d02 Eddie James 2023-08-09   675  					cfam@0,0 {
fa9d3b8be23d02 Eddie James 2023-08-09   676  						reg = <0 0>;
fa9d3b8be23d02 Eddie James 2023-08-09   677  						#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   678  						#size-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   679  						chip-id = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   680  
fa9d3b8be23d02 Eddie James 2023-08-09   681  						scom314: scom@1000 {
fa9d3b8be23d02 Eddie James 2023-08-09   682  							compatible = "ibm,i2cr-scom";
fa9d3b8be23d02 Eddie James 2023-08-09   683  							reg = <0x1000 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   684  						};
fa9d3b8be23d02 Eddie James 2023-08-09   685  
fa9d3b8be23d02 Eddie James 2023-08-09   686  						sbefifo314: sbefifo@2400 {
fa9d3b8be23d02 Eddie James 2023-08-09   687  							compatible = "ibm,p9-sbefifo";
fa9d3b8be23d02 Eddie James 2023-08-09   688  							reg = <0x2400 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   689  							#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   690  							#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   691  						};
fa9d3b8be23d02 Eddie James 2023-08-09   692  					};
fa9d3b8be23d02 Eddie James 2023-08-09   693  				};
fa9d3b8be23d02 Eddie James 2023-08-09   694  			};
fa9d3b8be23d02 Eddie James 2023-08-09   695  
fa9d3b8be23d02 Eddie James 2023-08-09   696  			cfam2_i2c15: i2c-bus@f {
fa9d3b8be23d02 Eddie James 2023-08-09   697  				#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   698  				#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   699  				reg = <15>;	/* OP5B */
fa9d3b8be23d02 Eddie James 2023-08-09   700  
fa9d3b8be23d02 Eddie James 2023-08-09   701  				i2cr@20 {
fa9d3b8be23d02 Eddie James 2023-08-09   702  					compatible = "ibm,i2cr-fsi-master";
fa9d3b8be23d02 Eddie James 2023-08-09   703  					reg = <0x20>;
fa9d3b8be23d02 Eddie James 2023-08-09   704  					#address-cells = <2>;
fa9d3b8be23d02 Eddie James 2023-08-09   705  					#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   706  
fa9d3b8be23d02 Eddie James 2023-08-09   707  					cfam@0,0 {
fa9d3b8be23d02 Eddie James 2023-08-09   708  						reg = <0 0>;
fa9d3b8be23d02 Eddie James 2023-08-09   709  						#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   710  						#size-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   711  						chip-id = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   712  
fa9d3b8be23d02 Eddie James 2023-08-09   713  						scom315: scom@1000 {
fa9d3b8be23d02 Eddie James 2023-08-09   714  							compatible = "ibm,i2cr-scom";
fa9d3b8be23d02 Eddie James 2023-08-09   715  							reg = <0x1000 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   716  						};
fa9d3b8be23d02 Eddie James 2023-08-09   717  
fa9d3b8be23d02 Eddie James 2023-08-09   718  						sbefifo315: sbefifo@2400 {
fa9d3b8be23d02 Eddie James 2023-08-09   719  							compatible = "ibm,p9-sbefifo";
fa9d3b8be23d02 Eddie James 2023-08-09   720  							reg = <0x2400 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   721  							#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   722  							#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   723  						};
fa9d3b8be23d02 Eddie James 2023-08-09   724  					};
fa9d3b8be23d02 Eddie James 2023-08-09   725  				};
fa9d3b8be23d02 Eddie James 2023-08-09   726  			};
fa9d3b8be23d02 Eddie James 2023-08-09   727  		};
fa9d3b8be23d02 Eddie James 2023-08-09   728  
fa9d3b8be23d02 Eddie James 2023-08-09   729  		fsi2spi@1c00 {
fa9d3b8be23d02 Eddie James 2023-08-09   730  			compatible = "ibm,fsi2spi";
fa9d3b8be23d02 Eddie James 2023-08-09   731  			reg = <0x1c00 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   732  			#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   733  			#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   734  
fa9d3b8be23d02 Eddie James 2023-08-09   735  			cfam2_spi0: spi@0 {
fa9d3b8be23d02 Eddie James 2023-08-09   736  				reg = <0x0>;
fa9d3b8be23d02 Eddie James 2023-08-09   737  				#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   738  				#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   739  
fa9d3b8be23d02 Eddie James 2023-08-09   740  				eeprom@0 {
fa9d3b8be23d02 Eddie James 2023-08-09   741  					at25,byte-len = <0x80000>;
fa9d3b8be23d02 Eddie James 2023-08-09   742  					at25,addr-mode = <4>;
fa9d3b8be23d02 Eddie James 2023-08-09   743  					at25,page-size = <256>;
fa9d3b8be23d02 Eddie James 2023-08-09   744  
fa9d3b8be23d02 Eddie James 2023-08-09   745  					compatible = "atmel,at25";
fa9d3b8be23d02 Eddie James 2023-08-09   746  					reg = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   747  					spi-max-frequency = <1000000>;
fa9d3b8be23d02 Eddie James 2023-08-09   748  				};
fa9d3b8be23d02 Eddie James 2023-08-09   749  			};
fa9d3b8be23d02 Eddie James 2023-08-09   750  
fa9d3b8be23d02 Eddie James 2023-08-09   751  			cfam2_spi1: spi@20 {
fa9d3b8be23d02 Eddie James 2023-08-09   752  				reg = <0x20>;
fa9d3b8be23d02 Eddie James 2023-08-09   753  				#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   754  				#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   755  
fa9d3b8be23d02 Eddie James 2023-08-09   756  				eeprom@0 {
fa9d3b8be23d02 Eddie James 2023-08-09   757  					at25,byte-len = <0x80000>;
fa9d3b8be23d02 Eddie James 2023-08-09   758  					at25,addr-mode = <4>;
fa9d3b8be23d02 Eddie James 2023-08-09   759  					at25,page-size = <256>;
fa9d3b8be23d02 Eddie James 2023-08-09   760  
fa9d3b8be23d02 Eddie James 2023-08-09   761  					compatible = "atmel,at25";
fa9d3b8be23d02 Eddie James 2023-08-09   762  					reg = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   763  					spi-max-frequency = <1000000>;
fa9d3b8be23d02 Eddie James 2023-08-09   764  				};
fa9d3b8be23d02 Eddie James 2023-08-09   765  			};
fa9d3b8be23d02 Eddie James 2023-08-09   766  
fa9d3b8be23d02 Eddie James 2023-08-09   767  			cfam2_spi2: spi@40 {
fa9d3b8be23d02 Eddie James 2023-08-09   768  				reg = <0x40>;
fa9d3b8be23d02 Eddie James 2023-08-09   769  				compatible =  "ibm,fsi2spi";
fa9d3b8be23d02 Eddie James 2023-08-09   770  				#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   771  				#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   772  
fa9d3b8be23d02 Eddie James 2023-08-09   773  				eeprom@0 {
fa9d3b8be23d02 Eddie James 2023-08-09   774  					at25,byte-len = <0x80000>;
fa9d3b8be23d02 Eddie James 2023-08-09   775  					at25,addr-mode = <4>;
fa9d3b8be23d02 Eddie James 2023-08-09   776  					at25,page-size = <256>;
fa9d3b8be23d02 Eddie James 2023-08-09   777  
fa9d3b8be23d02 Eddie James 2023-08-09   778  					compatible = "atmel,at25";
fa9d3b8be23d02 Eddie James 2023-08-09   779  					reg = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   780  					spi-max-frequency = <1000000>;
fa9d3b8be23d02 Eddie James 2023-08-09   781  				};
fa9d3b8be23d02 Eddie James 2023-08-09   782  			};
fa9d3b8be23d02 Eddie James 2023-08-09   783  
fa9d3b8be23d02 Eddie James 2023-08-09   784  			cfam2_spi3: spi@60 {
fa9d3b8be23d02 Eddie James 2023-08-09   785  				reg = <0x60>;
fa9d3b8be23d02 Eddie James 2023-08-09   786  				compatible =  "ibm,fsi2spi";
fa9d3b8be23d02 Eddie James 2023-08-09   787  				#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   788  				#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   789  
fa9d3b8be23d02 Eddie James 2023-08-09   790  				eeprom@0 {
fa9d3b8be23d02 Eddie James 2023-08-09   791  					at25,byte-len = <0x80000>;
fa9d3b8be23d02 Eddie James 2023-08-09   792  					at25,addr-mode = <4>;
fa9d3b8be23d02 Eddie James 2023-08-09   793  					at25,page-size = <256>;
fa9d3b8be23d02 Eddie James 2023-08-09   794  
fa9d3b8be23d02 Eddie James 2023-08-09   795  					compatible = "atmel,at25";
fa9d3b8be23d02 Eddie James 2023-08-09   796  					reg = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   797  					spi-max-frequency = <1000000>;
fa9d3b8be23d02 Eddie James 2023-08-09   798  				};
fa9d3b8be23d02 Eddie James 2023-08-09   799  			};
fa9d3b8be23d02 Eddie James 2023-08-09   800  		};
fa9d3b8be23d02 Eddie James 2023-08-09   801  
fa9d3b8be23d02 Eddie James 2023-08-09   802  		sbefifo@2400 {
fa9d3b8be23d02 Eddie James 2023-08-09   803  			compatible = "ibm,p9-sbefifo";
fa9d3b8be23d02 Eddie James 2023-08-09   804  			reg = <0x2400 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   805  			#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   806  			#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   807  
fa9d3b8be23d02 Eddie James 2023-08-09  @808  			fsi_occ2: occ {
fa9d3b8be23d02 Eddie James 2023-08-09   809  				compatible = "ibm,p10-occ";
fa9d3b8be23d02 Eddie James 2023-08-09   810  
fa9d3b8be23d02 Eddie James 2023-08-09   811  				occ-hwmon {
fa9d3b8be23d02 Eddie James 2023-08-09   812  					compatible = "ibm,p10-occ-hwmon";
fa9d3b8be23d02 Eddie James 2023-08-09   813  					ibm,no-poll-on-init;
fa9d3b8be23d02 Eddie James 2023-08-09   814  				};
fa9d3b8be23d02 Eddie James 2023-08-09   815  			};
fa9d3b8be23d02 Eddie James 2023-08-09   816  		};
fa9d3b8be23d02 Eddie James 2023-08-09   817  
fa9d3b8be23d02 Eddie James 2023-08-09   818  		fsi_hub2: hub@3400 {
fa9d3b8be23d02 Eddie James 2023-08-09   819  			compatible = "fsi-master-hub";
fa9d3b8be23d02 Eddie James 2023-08-09   820  			reg = <0x3400 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   821  			#address-cells = <2>;
fa9d3b8be23d02 Eddie James 2023-08-09   822  			#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   823  
fa9d3b8be23d02 Eddie James 2023-08-09   824  			no-scan-on-init;
fa9d3b8be23d02 Eddie James 2023-08-09   825  		};
fa9d3b8be23d02 Eddie James 2023-08-09   826  	};
fa9d3b8be23d02 Eddie James 2023-08-09   827  
fa9d3b8be23d02 Eddie James 2023-08-09   828  	cfam@3,0 {
fa9d3b8be23d02 Eddie James 2023-08-09   829  		reg = <3 0>;
fa9d3b8be23d02 Eddie James 2023-08-09   830  		#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   831  		#size-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   832  		chip-id = <3>;
fa9d3b8be23d02 Eddie James 2023-08-09   833  
fa9d3b8be23d02 Eddie James 2023-08-09   834  		scom@1000 {
fa9d3b8be23d02 Eddie James 2023-08-09   835  			compatible = "ibm,fsi2pib";
fa9d3b8be23d02 Eddie James 2023-08-09   836  			reg = <0x1000 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   837  		};
fa9d3b8be23d02 Eddie James 2023-08-09   838  
fa9d3b8be23d02 Eddie James 2023-08-09   839  		i2c@1800 {
fa9d3b8be23d02 Eddie James 2023-08-09   840  			compatible = "ibm,fsi-i2c-master";
fa9d3b8be23d02 Eddie James 2023-08-09   841  			reg = <0x1800 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   842  			#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   843  			#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   844  
fa9d3b8be23d02 Eddie James 2023-08-09   845  			cfam3_i2c2: i2c-bus@2 {
fa9d3b8be23d02 Eddie James 2023-08-09   846  				#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   847  				#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   848  				reg = <2>;	/* OM45 */
fa9d3b8be23d02 Eddie James 2023-08-09   849  
fa9d3b8be23d02 Eddie James 2023-08-09   850  				i2cr@20 {
fa9d3b8be23d02 Eddie James 2023-08-09   851  					compatible = "ibm,i2cr-fsi-master";
fa9d3b8be23d02 Eddie James 2023-08-09   852  					reg = <0x20>;
fa9d3b8be23d02 Eddie James 2023-08-09   853  					#address-cells = <2>;
fa9d3b8be23d02 Eddie James 2023-08-09   854  					#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   855  
fa9d3b8be23d02 Eddie James 2023-08-09   856  					cfam@0,0 {
fa9d3b8be23d02 Eddie James 2023-08-09   857  						reg = <0 0>;
fa9d3b8be23d02 Eddie James 2023-08-09   858  						#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   859  						#size-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   860  						chip-id = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   861  
fa9d3b8be23d02 Eddie James 2023-08-09   862  						scom402: scom@1000 {
fa9d3b8be23d02 Eddie James 2023-08-09   863  							compatible = "ibm,i2cr-scom";
fa9d3b8be23d02 Eddie James 2023-08-09   864  							reg = <0x1000 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   865  						};
fa9d3b8be23d02 Eddie James 2023-08-09   866  
fa9d3b8be23d02 Eddie James 2023-08-09   867  						sbefifo402: sbefifo@2400 {
fa9d3b8be23d02 Eddie James 2023-08-09   868  							compatible = "ibm,p9-sbefifo";
fa9d3b8be23d02 Eddie James 2023-08-09   869  							reg = <0x2400 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   870  							#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   871  							#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   872  						};
fa9d3b8be23d02 Eddie James 2023-08-09   873  					};
fa9d3b8be23d02 Eddie James 2023-08-09   874  				};
fa9d3b8be23d02 Eddie James 2023-08-09   875  			};
fa9d3b8be23d02 Eddie James 2023-08-09   876  
fa9d3b8be23d02 Eddie James 2023-08-09   877  			cfam3_i2c3: i2c-bus@3 {
fa9d3b8be23d02 Eddie James 2023-08-09   878  				#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   879  				#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   880  				reg = <3>;	/* OM67 */
fa9d3b8be23d02 Eddie James 2023-08-09   881  
fa9d3b8be23d02 Eddie James 2023-08-09   882  				i2cr@20 {
fa9d3b8be23d02 Eddie James 2023-08-09   883  					compatible = "ibm,i2cr-fsi-master";
fa9d3b8be23d02 Eddie James 2023-08-09   884  					reg = <0x20>;
fa9d3b8be23d02 Eddie James 2023-08-09   885  					#address-cells = <2>;
fa9d3b8be23d02 Eddie James 2023-08-09   886  					#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   887  
fa9d3b8be23d02 Eddie James 2023-08-09   888  					cfam@0,0 {
fa9d3b8be23d02 Eddie James 2023-08-09   889  						reg = <0 0>;
fa9d3b8be23d02 Eddie James 2023-08-09   890  						#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   891  						#size-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   892  						chip-id = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   893  
fa9d3b8be23d02 Eddie James 2023-08-09   894  						scom403: scom@1000 {
fa9d3b8be23d02 Eddie James 2023-08-09   895  							compatible = "ibm,i2cr-scom";
fa9d3b8be23d02 Eddie James 2023-08-09   896  							reg = <0x1000 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   897  						};
fa9d3b8be23d02 Eddie James 2023-08-09   898  
fa9d3b8be23d02 Eddie James 2023-08-09   899  						sbefifo403: sbefifo@2400 {
fa9d3b8be23d02 Eddie James 2023-08-09   900  							compatible = "ibm,p9-sbefifo";
fa9d3b8be23d02 Eddie James 2023-08-09   901  							reg = <0x2400 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   902  							#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   903  							#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   904  						};
fa9d3b8be23d02 Eddie James 2023-08-09   905  					};
fa9d3b8be23d02 Eddie James 2023-08-09   906  				};
fa9d3b8be23d02 Eddie James 2023-08-09   907  			};
fa9d3b8be23d02 Eddie James 2023-08-09   908  
fa9d3b8be23d02 Eddie James 2023-08-09   909  			cfam3_i2c10: i2c-bus@a {
fa9d3b8be23d02 Eddie James 2023-08-09   910  				#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   911  				#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   912  				reg = <10>;	/* OP3A */
fa9d3b8be23d02 Eddie James 2023-08-09   913  
fa9d3b8be23d02 Eddie James 2023-08-09   914  				i2cr@20 {
fa9d3b8be23d02 Eddie James 2023-08-09   915  					compatible = "ibm,i2cr-fsi-master";
fa9d3b8be23d02 Eddie James 2023-08-09   916  					reg = <0x20>;
fa9d3b8be23d02 Eddie James 2023-08-09   917  					#address-cells = <2>;
fa9d3b8be23d02 Eddie James 2023-08-09   918  					#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   919  
fa9d3b8be23d02 Eddie James 2023-08-09   920  					cfam@0,0 {
fa9d3b8be23d02 Eddie James 2023-08-09   921  						reg = <0 0>;
fa9d3b8be23d02 Eddie James 2023-08-09   922  						#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   923  						#size-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   924  						chip-id = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   925  
fa9d3b8be23d02 Eddie James 2023-08-09   926  						scom410: scom@1000 {
fa9d3b8be23d02 Eddie James 2023-08-09   927  							compatible = "ibm,i2cr-scom";
fa9d3b8be23d02 Eddie James 2023-08-09   928  							reg = <0x1000 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   929  						};
fa9d3b8be23d02 Eddie James 2023-08-09   930  
fa9d3b8be23d02 Eddie James 2023-08-09   931  						sbefifo410: sbefifo@2400 {
fa9d3b8be23d02 Eddie James 2023-08-09   932  							compatible = "ibm,p9-sbefifo";
fa9d3b8be23d02 Eddie James 2023-08-09   933  							reg = <0x2400 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   934  							#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   935  							#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   936  						};
fa9d3b8be23d02 Eddie James 2023-08-09   937  					};
fa9d3b8be23d02 Eddie James 2023-08-09   938  				};
fa9d3b8be23d02 Eddie James 2023-08-09   939  			};
fa9d3b8be23d02 Eddie James 2023-08-09   940  
fa9d3b8be23d02 Eddie James 2023-08-09   941  			cfam3_i2c11: i2c-bus@b {
fa9d3b8be23d02 Eddie James 2023-08-09   942  				#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   943  				#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   944  				reg = <11>;	/* OP3B */
fa9d3b8be23d02 Eddie James 2023-08-09   945  
fa9d3b8be23d02 Eddie James 2023-08-09   946  				i2cr@20 {
fa9d3b8be23d02 Eddie James 2023-08-09   947  					compatible = "ibm,i2cr-fsi-master";
fa9d3b8be23d02 Eddie James 2023-08-09   948  					reg = <0x20>;
fa9d3b8be23d02 Eddie James 2023-08-09   949  					#address-cells = <2>;
fa9d3b8be23d02 Eddie James 2023-08-09   950  					#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   951  
fa9d3b8be23d02 Eddie James 2023-08-09   952  					cfam@0,0 {
fa9d3b8be23d02 Eddie James 2023-08-09   953  						reg = <0 0>;
fa9d3b8be23d02 Eddie James 2023-08-09   954  						#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   955  						#size-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   956  						chip-id = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   957  
fa9d3b8be23d02 Eddie James 2023-08-09   958  						scom411: scom@1000 {
fa9d3b8be23d02 Eddie James 2023-08-09   959  							compatible = "ibm,i2cr-scom";
fa9d3b8be23d02 Eddie James 2023-08-09   960  							reg = <0x1000 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   961  						};
fa9d3b8be23d02 Eddie James 2023-08-09   962  
fa9d3b8be23d02 Eddie James 2023-08-09   963  						sbefifo411: sbefifo@2400 {
fa9d3b8be23d02 Eddie James 2023-08-09   964  							compatible = "ibm,p9-sbefifo";
fa9d3b8be23d02 Eddie James 2023-08-09   965  							reg = <0x2400 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   966  							#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   967  							#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   968  						};
fa9d3b8be23d02 Eddie James 2023-08-09   969  					};
fa9d3b8be23d02 Eddie James 2023-08-09   970  				};
fa9d3b8be23d02 Eddie James 2023-08-09   971  			};
fa9d3b8be23d02 Eddie James 2023-08-09   972  
fa9d3b8be23d02 Eddie James 2023-08-09   973  			cfam3_i2c14: i2c-bus@e {
fa9d3b8be23d02 Eddie James 2023-08-09   974  				#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   975  				#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   976  				reg = <14>;	/* OP5A */
fa9d3b8be23d02 Eddie James 2023-08-09   977  
fa9d3b8be23d02 Eddie James 2023-08-09   978  				i2cr@20 {
fa9d3b8be23d02 Eddie James 2023-08-09   979  					compatible = "ibm,i2cr-fsi-master";
fa9d3b8be23d02 Eddie James 2023-08-09   980  					reg = <0x20>;
fa9d3b8be23d02 Eddie James 2023-08-09   981  					#address-cells = <2>;
fa9d3b8be23d02 Eddie James 2023-08-09   982  					#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   983  
fa9d3b8be23d02 Eddie James 2023-08-09   984  					cfam@0,0 {
fa9d3b8be23d02 Eddie James 2023-08-09   985  						reg = <0 0>;
fa9d3b8be23d02 Eddie James 2023-08-09   986  						#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   987  						#size-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   988  						chip-id = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09   989  
fa9d3b8be23d02 Eddie James 2023-08-09   990  						scom414: scom@1000 {
fa9d3b8be23d02 Eddie James 2023-08-09   991  							compatible = "ibm,i2cr-scom";
fa9d3b8be23d02 Eddie James 2023-08-09   992  							reg = <0x1000 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   993  						};
fa9d3b8be23d02 Eddie James 2023-08-09   994  
fa9d3b8be23d02 Eddie James 2023-08-09   995  						sbefifo414: sbefifo@2400 {
fa9d3b8be23d02 Eddie James 2023-08-09   996  							compatible = "ibm,p9-sbefifo";
fa9d3b8be23d02 Eddie James 2023-08-09   997  							reg = <0x2400 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09   998  							#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09   999  							#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1000  						};
fa9d3b8be23d02 Eddie James 2023-08-09  1001  					};
fa9d3b8be23d02 Eddie James 2023-08-09  1002  				};
fa9d3b8be23d02 Eddie James 2023-08-09  1003  			};
fa9d3b8be23d02 Eddie James 2023-08-09  1004  
fa9d3b8be23d02 Eddie James 2023-08-09  1005  			cfam3_i2c15: i2c-bus@f {
fa9d3b8be23d02 Eddie James 2023-08-09  1006  				#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09  1007  				#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1008  				reg = <15>;	/* OP5B */
fa9d3b8be23d02 Eddie James 2023-08-09  1009  
fa9d3b8be23d02 Eddie James 2023-08-09  1010  				i2cr@20 {
fa9d3b8be23d02 Eddie James 2023-08-09  1011  					compatible = "ibm,i2cr-fsi-master";
fa9d3b8be23d02 Eddie James 2023-08-09  1012  					reg = <0x20>;
fa9d3b8be23d02 Eddie James 2023-08-09  1013  					#address-cells = <2>;
fa9d3b8be23d02 Eddie James 2023-08-09  1014  					#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1015  
fa9d3b8be23d02 Eddie James 2023-08-09  1016  					cfam@0,0 {
fa9d3b8be23d02 Eddie James 2023-08-09  1017  						reg = <0 0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1018  						#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09  1019  						#size-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09  1020  						chip-id = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1021  
fa9d3b8be23d02 Eddie James 2023-08-09  1022  						scom415: scom@1000 {
fa9d3b8be23d02 Eddie James 2023-08-09  1023  							compatible = "ibm,i2cr-scom";
fa9d3b8be23d02 Eddie James 2023-08-09  1024  							reg = <0x1000 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09  1025  						};
fa9d3b8be23d02 Eddie James 2023-08-09  1026  
fa9d3b8be23d02 Eddie James 2023-08-09  1027  						sbefifo415: sbefifo@2400 {
fa9d3b8be23d02 Eddie James 2023-08-09  1028  							compatible = "ibm,p9-sbefifo";
fa9d3b8be23d02 Eddie James 2023-08-09  1029  							reg = <0x2400 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09  1030  							#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09  1031  							#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1032  						};
fa9d3b8be23d02 Eddie James 2023-08-09  1033  					};
fa9d3b8be23d02 Eddie James 2023-08-09  1034  				};
fa9d3b8be23d02 Eddie James 2023-08-09  1035  			};
fa9d3b8be23d02 Eddie James 2023-08-09  1036  
fa9d3b8be23d02 Eddie James 2023-08-09  1037  			cfam3_i2c16: i2c-bus@10 {
fa9d3b8be23d02 Eddie James 2023-08-09  1038  				#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09  1039  				#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1040  				reg = <16>;	/* OP6A */
fa9d3b8be23d02 Eddie James 2023-08-09  1041  
fa9d3b8be23d02 Eddie James 2023-08-09  1042  				i2cr@20 {
fa9d3b8be23d02 Eddie James 2023-08-09  1043  					compatible = "ibm,i2cr-fsi-master";
fa9d3b8be23d02 Eddie James 2023-08-09  1044  					reg = <0x20>;
fa9d3b8be23d02 Eddie James 2023-08-09  1045  					#address-cells = <2>;
fa9d3b8be23d02 Eddie James 2023-08-09  1046  					#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1047  
fa9d3b8be23d02 Eddie James 2023-08-09  1048  					cfam@0,0 {
fa9d3b8be23d02 Eddie James 2023-08-09  1049  						reg = <0 0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1050  						#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09  1051  						#size-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09  1052  						chip-id = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1053  
fa9d3b8be23d02 Eddie James 2023-08-09  1054  						scom416: scom@1000 {
fa9d3b8be23d02 Eddie James 2023-08-09  1055  							compatible = "ibm,i2cr-scom";
fa9d3b8be23d02 Eddie James 2023-08-09  1056  							reg = <0x1000 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09  1057  						};
fa9d3b8be23d02 Eddie James 2023-08-09  1058  
fa9d3b8be23d02 Eddie James 2023-08-09  1059  						sbefifo416: sbefifo@2400 {
fa9d3b8be23d02 Eddie James 2023-08-09  1060  							compatible = "ibm,p9-sbefifo";
fa9d3b8be23d02 Eddie James 2023-08-09  1061  							reg = <0x2400 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09  1062  							#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09  1063  							#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1064  						};
fa9d3b8be23d02 Eddie James 2023-08-09  1065  					};
fa9d3b8be23d02 Eddie James 2023-08-09  1066  				};
fa9d3b8be23d02 Eddie James 2023-08-09  1067  			};
fa9d3b8be23d02 Eddie James 2023-08-09  1068  
fa9d3b8be23d02 Eddie James 2023-08-09  1069  			cfam3_i2c17: i2c-bus@11 {
fa9d3b8be23d02 Eddie James 2023-08-09  1070  				#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09  1071  				#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1072  				reg = <17>;	/* OP6B */
fa9d3b8be23d02 Eddie James 2023-08-09  1073  
fa9d3b8be23d02 Eddie James 2023-08-09  1074  				i2cr@20 {
fa9d3b8be23d02 Eddie James 2023-08-09  1075  					compatible = "ibm,i2cr-fsi-master";
fa9d3b8be23d02 Eddie James 2023-08-09  1076  					reg = <0x20>;
fa9d3b8be23d02 Eddie James 2023-08-09  1077  					#address-cells = <2>;
fa9d3b8be23d02 Eddie James 2023-08-09  1078  					#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1079  
fa9d3b8be23d02 Eddie James 2023-08-09  1080  					cfam@0,0 {
fa9d3b8be23d02 Eddie James 2023-08-09  1081  						reg = <0 0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1082  						#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09  1083  						#size-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09  1084  						chip-id = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1085  
fa9d3b8be23d02 Eddie James 2023-08-09  1086  						scom417: scom@1000 {
fa9d3b8be23d02 Eddie James 2023-08-09  1087  							compatible = "ibm,i2cr-scom";
fa9d3b8be23d02 Eddie James 2023-08-09  1088  							reg = <0x1000 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09  1089  						};
fa9d3b8be23d02 Eddie James 2023-08-09  1090  
fa9d3b8be23d02 Eddie James 2023-08-09  1091  						sbefifo417: sbefifo@2400 {
fa9d3b8be23d02 Eddie James 2023-08-09  1092  							compatible = "ibm,p9-sbefifo";
fa9d3b8be23d02 Eddie James 2023-08-09  1093  							reg = <0x2400 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09  1094  							#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09  1095  							#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1096  						};
fa9d3b8be23d02 Eddie James 2023-08-09  1097  					};
fa9d3b8be23d02 Eddie James 2023-08-09  1098  				};
fa9d3b8be23d02 Eddie James 2023-08-09  1099  			};
fa9d3b8be23d02 Eddie James 2023-08-09  1100  		};
fa9d3b8be23d02 Eddie James 2023-08-09  1101  
fa9d3b8be23d02 Eddie James 2023-08-09  1102  		fsi2spi@1c00 {
fa9d3b8be23d02 Eddie James 2023-08-09  1103  			compatible = "ibm,fsi2spi";
fa9d3b8be23d02 Eddie James 2023-08-09  1104  			reg = <0x1c00 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09  1105  			#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09  1106  			#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1107  
fa9d3b8be23d02 Eddie James 2023-08-09  1108  			cfam3_spi0: spi@0 {
fa9d3b8be23d02 Eddie James 2023-08-09  1109  				reg = <0x0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1110  				#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09  1111  				#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1112  
fa9d3b8be23d02 Eddie James 2023-08-09  1113  				eeprom@0 {
fa9d3b8be23d02 Eddie James 2023-08-09  1114  					at25,byte-len = <0x80000>;
fa9d3b8be23d02 Eddie James 2023-08-09  1115  					at25,addr-mode = <4>;
fa9d3b8be23d02 Eddie James 2023-08-09  1116  					at25,page-size = <256>;
fa9d3b8be23d02 Eddie James 2023-08-09  1117  
fa9d3b8be23d02 Eddie James 2023-08-09  1118  					compatible = "atmel,at25";
fa9d3b8be23d02 Eddie James 2023-08-09  1119  					reg = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1120  					spi-max-frequency = <1000000>;
fa9d3b8be23d02 Eddie James 2023-08-09  1121  				};
fa9d3b8be23d02 Eddie James 2023-08-09  1122  			};
fa9d3b8be23d02 Eddie James 2023-08-09  1123  
fa9d3b8be23d02 Eddie James 2023-08-09  1124  			cfam3_spi1: spi@20 {
fa9d3b8be23d02 Eddie James 2023-08-09  1125  				reg = <0x20>;
fa9d3b8be23d02 Eddie James 2023-08-09  1126  				#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09  1127  				#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1128  
fa9d3b8be23d02 Eddie James 2023-08-09  1129  				eeprom@0 {
fa9d3b8be23d02 Eddie James 2023-08-09  1130  					at25,byte-len = <0x80000>;
fa9d3b8be23d02 Eddie James 2023-08-09  1131  					at25,addr-mode = <4>;
fa9d3b8be23d02 Eddie James 2023-08-09  1132  					at25,page-size = <256>;
fa9d3b8be23d02 Eddie James 2023-08-09  1133  
fa9d3b8be23d02 Eddie James 2023-08-09  1134  					compatible = "atmel,at25";
fa9d3b8be23d02 Eddie James 2023-08-09  1135  					reg = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1136  					spi-max-frequency = <1000000>;
fa9d3b8be23d02 Eddie James 2023-08-09  1137  				};
fa9d3b8be23d02 Eddie James 2023-08-09  1138  			};
fa9d3b8be23d02 Eddie James 2023-08-09  1139  
fa9d3b8be23d02 Eddie James 2023-08-09  1140  			cfam3_spi2: spi@40 {
fa9d3b8be23d02 Eddie James 2023-08-09  1141  				reg = <0x40>;
fa9d3b8be23d02 Eddie James 2023-08-09  1142  				compatible =  "ibm,fsi2spi";
fa9d3b8be23d02 Eddie James 2023-08-09  1143  				#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09  1144  				#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1145  
fa9d3b8be23d02 Eddie James 2023-08-09  1146  				eeprom@0 {
fa9d3b8be23d02 Eddie James 2023-08-09  1147  					at25,byte-len = <0x80000>;
fa9d3b8be23d02 Eddie James 2023-08-09  1148  					at25,addr-mode = <4>;
fa9d3b8be23d02 Eddie James 2023-08-09  1149  					at25,page-size = <256>;
fa9d3b8be23d02 Eddie James 2023-08-09  1150  
fa9d3b8be23d02 Eddie James 2023-08-09  1151  					compatible = "atmel,at25";
fa9d3b8be23d02 Eddie James 2023-08-09  1152  					reg = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1153  					spi-max-frequency = <1000000>;
fa9d3b8be23d02 Eddie James 2023-08-09  1154  				};
fa9d3b8be23d02 Eddie James 2023-08-09  1155  			};
fa9d3b8be23d02 Eddie James 2023-08-09  1156  
fa9d3b8be23d02 Eddie James 2023-08-09  1157  			cfam3_spi3: spi@60 {
fa9d3b8be23d02 Eddie James 2023-08-09  1158  				reg = <0x60>;
fa9d3b8be23d02 Eddie James 2023-08-09  1159  				compatible =  "ibm,fsi2spi";
fa9d3b8be23d02 Eddie James 2023-08-09  1160  				#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09  1161  				#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1162  
fa9d3b8be23d02 Eddie James 2023-08-09  1163  				eeprom@0 {
fa9d3b8be23d02 Eddie James 2023-08-09  1164  					at25,byte-len = <0x80000>;
fa9d3b8be23d02 Eddie James 2023-08-09  1165  					at25,addr-mode = <4>;
fa9d3b8be23d02 Eddie James 2023-08-09  1166  					at25,page-size = <256>;
fa9d3b8be23d02 Eddie James 2023-08-09  1167  
fa9d3b8be23d02 Eddie James 2023-08-09  1168  					compatible = "atmel,at25";
fa9d3b8be23d02 Eddie James 2023-08-09  1169  					reg = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1170  					spi-max-frequency = <1000000>;
fa9d3b8be23d02 Eddie James 2023-08-09  1171  				};
fa9d3b8be23d02 Eddie James 2023-08-09  1172  			};
fa9d3b8be23d02 Eddie James 2023-08-09  1173  		};
fa9d3b8be23d02 Eddie James 2023-08-09  1174  
fa9d3b8be23d02 Eddie James 2023-08-09  1175  		sbefifo@2400 {
fa9d3b8be23d02 Eddie James 2023-08-09  1176  			compatible = "ibm,p9-sbefifo";
fa9d3b8be23d02 Eddie James 2023-08-09  1177  			reg = <0x2400 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09  1178  			#address-cells = <1>;
fa9d3b8be23d02 Eddie James 2023-08-09  1179  			#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1180  
fa9d3b8be23d02 Eddie James 2023-08-09  1181  			fsi_occ3: occ {
fa9d3b8be23d02 Eddie James 2023-08-09  1182  				compatible = "ibm,p10-occ";
fa9d3b8be23d02 Eddie James 2023-08-09  1183  
fa9d3b8be23d02 Eddie James 2023-08-09  1184  				occ-hwmon {
fa9d3b8be23d02 Eddie James 2023-08-09  1185  					compatible = "ibm,p10-occ-hwmon";
fa9d3b8be23d02 Eddie James 2023-08-09  1186  					ibm,no-poll-on-init;
fa9d3b8be23d02 Eddie James 2023-08-09  1187  				};
fa9d3b8be23d02 Eddie James 2023-08-09  1188  			};
fa9d3b8be23d02 Eddie James 2023-08-09  1189  		};
fa9d3b8be23d02 Eddie James 2023-08-09  1190  
fa9d3b8be23d02 Eddie James 2023-08-09  1191  		fsi_hub3: hub@3400 {
fa9d3b8be23d02 Eddie James 2023-08-09  1192  			compatible = "fsi-master-hub";
fa9d3b8be23d02 Eddie James 2023-08-09  1193  			reg = <0x3400 0x400>;
fa9d3b8be23d02 Eddie James 2023-08-09  1194  			#address-cells = <2>;
fa9d3b8be23d02 Eddie James 2023-08-09  1195  			#size-cells = <0>;
fa9d3b8be23d02 Eddie James 2023-08-09  1196  
fa9d3b8be23d02 Eddie James 2023-08-09  1197  			no-scan-on-init;
fa9d3b8be23d02 Eddie James 2023-08-09  1198  		};
fa9d3b8be23d02 Eddie James 2023-08-09  1199  	};
fa9d3b8be23d02 Eddie James 2023-08-09  1200  };
fa9d3b8be23d02 Eddie James 2023-08-09  1201  

:::::: The code at line 808 was first introduced by commit
:::::: fa9d3b8be23d02f22f7476c2df2c7aa6e67fb115 ARM: dts: aspeed: Add P10 FSI descriptions

:::::: TO: Eddie James <eajames@linux.ibm.com>
:::::: CC: Joel Stanley <joel@jms.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
