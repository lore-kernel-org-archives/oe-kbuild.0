Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ABA81F
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Dec 2022 07:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671350234; x=1702886234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4aQqIX184/QLBGLidmhtEu/4OC5Eghc7xC3e4c+uUxU=;
  b=GuWA7yNH4DuYmIT75176GkAeMUPk9yq4UZAbcINQtGYXwinCXrtKRK25
   z/pkfONWmH8NbS+LMDV+uim90kaRB/L7yoe7tIMTmYV/vHhHqFbZQAAmi
   vkep4dJmCM/fc7NwDRdc9AJk9TcUy3ajk8czZ/ig0ez+y6w8L67LhSBwv
   2Ic//eikqfw3yAZHQeLtrYYB68kQWcbQ3CrKvm26VblPmK3i8B3o022Ph
   rQs+c9qjq17VrgYxracXT1chfC7CGdS1EU1cH7verUX3EZciVbxJo3ryR
   DQcV2yOcXjB9cwwb4aNZyZ0XQ0MJyGW2xPoRzHeRai95M4vBpEqKWD0/r
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10564"; a="405436602"
X-IronPort-AV: E=Sophos;i="5.96,254,1665471600"; 
   d="scan'208";a="405436602"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2022 23:57:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10564"; a="792545361"
X-IronPort-AV: E=Sophos;i="5.96,254,1665471600"; 
   d="scan'208";a="792545361"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Dec 2022 23:57:13 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p6oXo-000896-1J;
	Sun, 18 Dec 2022 07:57:12 +0000
Date: Sun, 18 Dec 2022 15:56:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/acpi/property.c:1138:9: warning: Syntax Error: AST broken,
 'if' doesn't have two operands. [internalAstError]
Message-ID: <202212181518.MBDYNZCN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/acpi/property.c:1138:9: warning: Syntax Error: AST broken, 'if' doesn't have two operands. [internalAstError]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Stefan Binding <sbinding@opensource.cirrus.com>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f9ff5644bcc04221bae56f922122f2b7f5d24d62
commit: 06865077b34c792181e3c4f82417a2888c6e7453 ACPI: property: Fix type detection of unified integer reading functions
date:   4 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 4 months ago
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 06865077b34c792181e3c4f82417a2888c6e7453
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/acpi/property.c:1138:9: warning: Syntax Error: AST broken, 'if' doesn't have two operands. [internalAstError]
     ret = acpi_copy_property_array_uint(items, (u8 *)val, nval);
           ^

vim +1138 drivers/acpi/property.c

b31384fa5de37a Rafael J. Wysocki 2014-11-04  1073  
99a85464693faa Sakari Ailus      2017-07-21  1074  static int acpi_data_prop_read(const struct acpi_device_data *data,
3a7a2ab839ad18 Rafael J. Wysocki 2015-08-27  1075  			       const char *propname,
3a7a2ab839ad18 Rafael J. Wysocki 2015-08-27  1076  			       enum dev_prop_type proptype,
3a7a2ab839ad18 Rafael J. Wysocki 2015-08-27  1077  			       void *val, size_t nval)
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1078  {
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1079  	const union acpi_object *obj;
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1080  	const union acpi_object *items;
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1081  	int ret;
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1082  
e1e6bd2995ac0e Rafael J. Wysocki 2021-02-11  1083  	if (nval == 1 || !val) {
3a7a2ab839ad18 Rafael J. Wysocki 2015-08-27  1084  		ret = acpi_data_prop_read_single(data, propname, proptype, val);
e1e6bd2995ac0e Rafael J. Wysocki 2021-02-11  1085  		/*
e1e6bd2995ac0e Rafael J. Wysocki 2021-02-11  1086  		 * The overflow error means that the property is there and it is
e1e6bd2995ac0e Rafael J. Wysocki 2021-02-11  1087  		 * single-value, but its type does not match, so return.
e1e6bd2995ac0e Rafael J. Wysocki 2021-02-11  1088  		 */
e1e6bd2995ac0e Rafael J. Wysocki 2021-02-11  1089  		if (ret >= 0 || ret == -EOVERFLOW)
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1090  			return ret;
e1e6bd2995ac0e Rafael J. Wysocki 2021-02-11  1091  
e1e6bd2995ac0e Rafael J. Wysocki 2021-02-11  1092  		/*
e1e6bd2995ac0e Rafael J. Wysocki 2021-02-11  1093  		 * Reading this property as a single-value one failed, but its
e1e6bd2995ac0e Rafael J. Wysocki 2021-02-11  1094  		 * value may still be represented as one-element array, so
e1e6bd2995ac0e Rafael J. Wysocki 2021-02-11  1095  		 * continue.
e1e6bd2995ac0e Rafael J. Wysocki 2021-02-11  1096  		 */
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1097  	}
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1098  
3a7a2ab839ad18 Rafael J. Wysocki 2015-08-27  1099  	ret = acpi_data_get_property_array(data, propname, ACPI_TYPE_ANY, &obj);
369af6bf2c28f9 Sakari Ailus      2022-07-11  1100  	if (ret && proptype >= DEV_PROP_U8 && proptype <= DEV_PROP_U64)
369af6bf2c28f9 Sakari Ailus      2022-07-11  1101  		ret = acpi_data_get_property(data, propname, ACPI_TYPE_BUFFER,
369af6bf2c28f9 Sakari Ailus      2022-07-11  1102  					     &obj);
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1103  	if (ret)
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1104  		return ret;
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1105  
369af6bf2c28f9 Sakari Ailus      2022-07-11  1106  	if (!val) {
369af6bf2c28f9 Sakari Ailus      2022-07-11  1107  		if (obj->type == ACPI_TYPE_BUFFER)
369af6bf2c28f9 Sakari Ailus      2022-07-11  1108  			return obj->buffer.length;
369af6bf2c28f9 Sakari Ailus      2022-07-11  1109  
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1110  		return obj->package.count;
369af6bf2c28f9 Sakari Ailus      2022-07-11  1111  	}
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1112  
369af6bf2c28f9 Sakari Ailus      2022-07-11  1113  	switch (proptype) {
369af6bf2c28f9 Sakari Ailus      2022-07-11  1114  	case DEV_PROP_STRING:
369af6bf2c28f9 Sakari Ailus      2022-07-11  1115  		break;
369af6bf2c28f9 Sakari Ailus      2022-07-11  1116  	case DEV_PROP_U8 ... DEV_PROP_U64:
369af6bf2c28f9 Sakari Ailus      2022-07-11  1117  		if (obj->type == ACPI_TYPE_BUFFER) {
369af6bf2c28f9 Sakari Ailus      2022-07-11  1118  			if (nval > obj->buffer.length)
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1119  				return -EOVERFLOW;
369af6bf2c28f9 Sakari Ailus      2022-07-11  1120  			break;
369af6bf2c28f9 Sakari Ailus      2022-07-11  1121  		}
369af6bf2c28f9 Sakari Ailus      2022-07-11  1122  		fallthrough;
369af6bf2c28f9 Sakari Ailus      2022-07-11  1123  	default:
369af6bf2c28f9 Sakari Ailus      2022-07-11  1124  		if (nval > obj->package.count)
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1125  			return -EOVERFLOW;
369af6bf2c28f9 Sakari Ailus      2022-07-11  1126  		break;
369af6bf2c28f9 Sakari Ailus      2022-07-11  1127  	}
9978f446d406a7 Andy Shevchenko   2022-02-09  1128  	if (nval == 0)
7dc59dc938f034 Andy Shevchenko   2015-08-10  1129  		return -EINVAL;
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1130  
369af6bf2c28f9 Sakari Ailus      2022-07-11  1131  	if (obj->type != ACPI_TYPE_BUFFER)
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1132  		items = obj->package.elements;
369af6bf2c28f9 Sakari Ailus      2022-07-11  1133  	else
369af6bf2c28f9 Sakari Ailus      2022-07-11  1134  		items = obj;
7dc59dc938f034 Andy Shevchenko   2015-08-10  1135  
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1136  	switch (proptype) {
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1137  	case DEV_PROP_U8:
923044133367c8 Sakari Ailus      2022-07-11 @1138  		ret = acpi_copy_property_array_uint(items, (u8 *)val, nval);
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1139  		break;
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1140  	case DEV_PROP_U16:
923044133367c8 Sakari Ailus      2022-07-11  1141  		ret = acpi_copy_property_array_uint(items, (u16 *)val, nval);
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1142  		break;
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1143  	case DEV_PROP_U32:
923044133367c8 Sakari Ailus      2022-07-11  1144  		ret = acpi_copy_property_array_uint(items, (u32 *)val, nval);
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1145  		break;
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1146  	case DEV_PROP_U64:
923044133367c8 Sakari Ailus      2022-07-11  1147  		ret = acpi_copy_property_array_uint(items, (u64 *)val, nval);
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1148  		break;
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1149  	case DEV_PROP_STRING:
b0b027cee090a1 Sakari Ailus      2017-03-28  1150  		ret = acpi_copy_property_array_string(
b0b027cee090a1 Sakari Ailus      2017-03-28  1151  			items, (char **)val,
b0b027cee090a1 Sakari Ailus      2017-03-28  1152  			min_t(u32, nval, obj->package.count));
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1153  		break;
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1154  	default:
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1155  		ret = -EINVAL;
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1156  		break;
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1157  	}
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1158  	return ret;
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1159  }
3a7a2ab839ad18 Rafael J. Wysocki 2015-08-27  1160  

:::::: The code at line 1138 was first introduced by commit
:::::: 923044133367c8d72662938da0ea531bbdb39799 ACPI: property: Unify integer value reading functions

:::::: TO: Sakari Ailus <sakari.ailus@linux.intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
