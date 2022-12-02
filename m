Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D333B1866;
	Fri,  2 Dec 2022 08:49:27 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id h4-20020a1c2104000000b003d0760654d3so4557508wmh.4;
        Fri, 02 Dec 2022 00:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DEkNJbonhEqu5dY+jlrp1/UgZKKYJ39ArTGumPmYSvM=;
        b=JBFwHGRpF6VsnwLRHijVuiypt07zXM6Z3woBqZnS+hSiHgmt2ECoyuCKE+3Pkv9Nkl
         giUux3GbJcoNiRRAe98KTWK/vCybU8X3sSx2ZZFboeUZ0Q/Pc6wBEAWl1gk6DQtHacbM
         hMFBZd/9fI9iyczypfhfExIJkV5q5B+EAOOEM4CgVPSDuLQEn8UgqBo9lKkVb+4bofwr
         P4RM8HIoE/LVXD2lAtd3vKGsDWTxqnBtl5e3mIaBN93tKha6ikDDMehas2tisi7yudSc
         73h9JLGbU8dDimoL0t6f1emV4ru5wXwL3ioELQGg31KKZfcjykr//LRe7EvnCIXkFk+Q
         7a2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DEkNJbonhEqu5dY+jlrp1/UgZKKYJ39ArTGumPmYSvM=;
        b=q6WjGgbKt86572gHiCTx9bE0Pg2NqHKmeEkkHhLUJnJUzKare39NpH6zBCFSvILZeJ
         8OjXKNBffXFE6UOjPDOwZU/IHgwtj5b24KDpsmXj0OGgMSFGQRcVC4xQwzWMiRhFYsN4
         7vqg4TOlHZyilfcH5/ngxB/2W9zYFpK8BwnXUQL0AAaux4U6FNkQap7PlR7za60jZdxl
         n9MNXNoPprHWhFMTnuZKXWW3zaITv0uQ27HCC99oMVBfGtYr3cIjnPAUfdCFFQ2qipDh
         boYeeaCOIey4dB2JgPi/LURBoe2Rz+qg4qT3VD4Y/d4jCsDngh0I7XIEG8D0NxN+PYsg
         18Hw==
X-Gm-Message-State: ANoB5plhtj3rgLpzyQbAjQVNVeyyPwFCiH9zRm644Zw7fR1iOmwXt6OV
	xKqZQoXkV1EMPMgGZoR51XYQ85FrBkc=
X-Google-Smtp-Source: AA0mqf53TNWM5HAkncAfBuQIcrnI4T1quWO/5+GDlBPPBbIpc8Im5uj/Fu13Cx12FE/yeGsQROZx3w==
X-Received: by 2002:a05:600c:35c7:b0:3cf:7dc1:f432 with SMTP id r7-20020a05600c35c700b003cf7dc1f432mr53352346wmq.148.1669970965683;
        Fri, 02 Dec 2022 00:49:25 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bs4-20020a056000070400b0023677081f3asm6423637wrb.42.2022.12.02.00.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 00:49:25 -0800 (PST)
Date: Fri, 2 Dec 2022 11:49:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Florian Westphal <fw@strlen.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mat Martineau <mathew.j.martineau@linux.intel.com>
Subject: net/mptcp/pm_netlink.c:1169 mptcp_pm_parse_pm_addr_attr() warn:
 missing error code? 'err'
Message-ID: <202212021422.Uh5cCKY2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221202084920.jG4dADq6myqN5YHbCX9wQB227URssb_TXMQcpg2EW3Q@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a4412fdd49dc011bcc2c0d81ac4cab7457092650
commit: 982f17ba1a2534b878fbcb1a5273bfbc551c5397 mptcp: netlink: split mptcp_pm_parse_addr into two functions
config: i386-randconfig-m021
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
net/mptcp/pm_netlink.c:1169 mptcp_pm_parse_pm_addr_attr() warn: missing error code? 'err'

vim +/err +1169 net/mptcp/pm_netlink.c

982f17ba1a2534 Florian Westphal 2022-05-03  1145  static int mptcp_pm_parse_pm_addr_attr(struct nlattr *tb[],
982f17ba1a2534 Florian Westphal 2022-05-03  1146  				       const struct nlattr *attr,
982f17ba1a2534 Florian Westphal 2022-05-03  1147  				       struct genl_info *info,
982f17ba1a2534 Florian Westphal 2022-05-03  1148  				       struct mptcp_addr_info *addr,
982f17ba1a2534 Florian Westphal 2022-05-03  1149  				       bool require_family)
01cacb00b35cb6 Paolo Abeni      2020-03-27  1150  {
01cacb00b35cb6 Paolo Abeni      2020-03-27  1151  	int err, addr_addr;
01cacb00b35cb6 Paolo Abeni      2020-03-27  1152  
01cacb00b35cb6 Paolo Abeni      2020-03-27  1153  	if (!attr) {
01cacb00b35cb6 Paolo Abeni      2020-03-27  1154  		GENL_SET_ERR_MSG(info, "missing address info");
01cacb00b35cb6 Paolo Abeni      2020-03-27  1155  		return -EINVAL;
01cacb00b35cb6 Paolo Abeni      2020-03-27  1156  	}
01cacb00b35cb6 Paolo Abeni      2020-03-27  1157  
01cacb00b35cb6 Paolo Abeni      2020-03-27  1158  	/* no validation needed - was already done via nested policy */
01cacb00b35cb6 Paolo Abeni      2020-03-27  1159  	err = nla_parse_nested_deprecated(tb, MPTCP_PM_ADDR_ATTR_MAX, attr,
01cacb00b35cb6 Paolo Abeni      2020-03-27  1160  					  mptcp_pm_addr_policy, info->extack);
01cacb00b35cb6 Paolo Abeni      2020-03-27  1161  	if (err)
01cacb00b35cb6 Paolo Abeni      2020-03-27  1162  		return err;
01cacb00b35cb6 Paolo Abeni      2020-03-27  1163  
982f17ba1a2534 Florian Westphal 2022-05-03  1164  	if (tb[MPTCP_PM_ADDR_ATTR_ID])
982f17ba1a2534 Florian Westphal 2022-05-03  1165  		addr->id = nla_get_u8(tb[MPTCP_PM_ADDR_ATTR_ID]);
982f17ba1a2534 Florian Westphal 2022-05-03  1166  
01cacb00b35cb6 Paolo Abeni      2020-03-27  1167  	if (!tb[MPTCP_PM_ADDR_ATTR_FAMILY]) {
01cacb00b35cb6 Paolo Abeni      2020-03-27  1168  		if (!require_family)
982f17ba1a2534 Florian Westphal 2022-05-03 @1169  			return err;

"err" is zero at this point.  Presumably a negative error code was
intended.

01cacb00b35cb6 Paolo Abeni      2020-03-27  1170  
01cacb00b35cb6 Paolo Abeni      2020-03-27  1171  		NL_SET_ERR_MSG_ATTR(info->extack, attr,
01cacb00b35cb6 Paolo Abeni      2020-03-27  1172  				    "missing family");
01cacb00b35cb6 Paolo Abeni      2020-03-27  1173  		return -EINVAL;
01cacb00b35cb6 Paolo Abeni      2020-03-27  1174  	}
01cacb00b35cb6 Paolo Abeni      2020-03-27  1175  
982f17ba1a2534 Florian Westphal 2022-05-03  1176  	addr->family = nla_get_u16(tb[MPTCP_PM_ADDR_ATTR_FAMILY]);
982f17ba1a2534 Florian Westphal 2022-05-03  1177  	if (addr->family != AF_INET
01cacb00b35cb6 Paolo Abeni      2020-03-27  1178  #if IS_ENABLED(CONFIG_MPTCP_IPV6)
982f17ba1a2534 Florian Westphal 2022-05-03  1179  	    && addr->family != AF_INET6
01cacb00b35cb6 Paolo Abeni      2020-03-27  1180  #endif
01cacb00b35cb6 Paolo Abeni      2020-03-27  1181  	    ) {
01cacb00b35cb6 Paolo Abeni      2020-03-27  1182  		NL_SET_ERR_MSG_ATTR(info->extack, attr,
01cacb00b35cb6 Paolo Abeni      2020-03-27  1183  				    "unknown address family");
01cacb00b35cb6 Paolo Abeni      2020-03-27  1184  		return -EINVAL;
01cacb00b35cb6 Paolo Abeni      2020-03-27  1185  	}
982f17ba1a2534 Florian Westphal 2022-05-03  1186  	addr_addr = mptcp_pm_family_to_addr(addr->family);
01cacb00b35cb6 Paolo Abeni      2020-03-27  1187  	if (!tb[addr_addr]) {
01cacb00b35cb6 Paolo Abeni      2020-03-27  1188  		NL_SET_ERR_MSG_ATTR(info->extack, attr,
01cacb00b35cb6 Paolo Abeni      2020-03-27  1189  				    "missing address data");
01cacb00b35cb6 Paolo Abeni      2020-03-27  1190  		return -EINVAL;
01cacb00b35cb6 Paolo Abeni      2020-03-27  1191  	}

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

