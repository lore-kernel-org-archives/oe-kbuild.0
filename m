Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF44113A25B
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jul 2024 13:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.85.210.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720012845; cv=fail; b=E/FR/zNVblZIcrR/d7LehjliRpmFrsZRc55LSJV9r43jWzYHGtek910LgdpWHO4HL1/SSRSU7SmXoHX+B3wx4EDvqKeZOgGCcMefdid98CwFnuIwsnbY9mk7jJ5a3NSpDOc6/POYePd0Ok5ou3nW1zlFtaMi2M3WUwIbEZC/KJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720012845; c=relaxed/simple;
	bh=DDu3U1nKbmxN8nKfISX+oMT6zBHqPMnyQQK5I4d4amU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=leoF19rpXESHRG/T+fP0nHxnO4ZwaxYyhxQd4crTuFWfheYdL6Gm1s0Ox8gYG6q+SAJlbUci0AtJ4vxHptF8cKsGFT3HH+5h1zq0jAVtpGb7M5l0LFcBqGeVz3vf2x1UtExJIhST4MraDDTxOp2lFgEQ7xJ0+DajqYjea+ft4mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=fail (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kaAT9usg reason="signature verification failed"; arc=fail smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kaAT9usg"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-700cd2b7729so314595a34.1
        for <oe-kbuild@lists.linux.dev>; Wed, 03 Jul 2024 06:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720012842; x=1720617642;
        h=dkim-signature:content-disposition:mime-version:message-id:subject
         :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbQShHhaB6uK5KbPgT1pMNF8rTXtKbrDBdhgMopql3E=;
        b=aqk8DCjxh8MwQVouHuGb/DPsdMcOmU6llkJmzTOlhuz4H4D0J1eHbVcOV6A1esXiIp
         /2SC+Szfg9XnqxC/nHjWntrOl77GqM9VQ2DsZ5zSCrUK7iG/kPHUIs1QqxAeXJ1T0npc
         EKbpqrMjHGE+9+VjfQkTxh2P72WxoJLgrX3x5BqlBW9HgMtCxtCCEI/q0dVS/a4hdKGn
         78TKOIBQNm/oPQunh02MwpEZFkTv4miAdrx//lmeRlLAFGHYfZeZSb1ecDVHq1dlMffR
         +l3Jhy9vkQQJg5Ml95mGm/IRp6td4l9bWaWpK3wP2E4OvKo/e0jGZhNSSvUEDTTf5NYg
         exuQ==
X-Gm-Message-State: AOJu0YzTxT5+chsffhLayATxC0onFh6DynXgPtGgIPpxoV2kBKI8pyDN
	gvmZHNUbsE75uFg8igOzxdj5loglvJNz7Gi/Yqry2n29yQkPK9M7LD8mPmdGBgLY5gSbQ+zsGoI
	M
X-Google-Smtp-Source: AGHT+IFp1dLhrSR5uzqFv3Uax2zk5IoJDPEg8W94m0sV5DHb6mcpw8dr3bmRKhoOPOTyGiZScjSGIg==
X-Received: by 2002:a05:6830:3087:b0:6f9:d203:8d13 with SMTP id 46e09a7af769-7022931995dmr793447a34.0.1720012842444;
        Wed, 03 Jul 2024 06:20:42 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:a6f1:b7be:4c8c:bf62])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20a7fsm1969040a34.59.2024.07.03.06.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 06:20:41 -0700 (PDT)
Date: Wed, 3 Jul 2024 15:20:39 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [anna-maria-devel:timers/misc 5/8] kernel/time/timer_migration.c:539
 __walk_groups() warn: variable dereferenced before check 'group' (see line
 538)
Message-ID: <c458d575-de51-406d-beed-a1c0dafef738@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received: from imap.gmail.com ([2607:f8b0:4023:1009::6c]:993) by suswa with
 IMAP4-SSL getmail6 msgid:674269650/302469; 03 Jul 2024 03:38:09 -0000
Received: by 2002:a5d:414f:0:b0:367:91bd:d0dc with SMTP id c15csp176515wrq;
 Tue, 2 Jul 2024 20:37:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2;
 AJvYcCU6P33VWZF6d4kU/ltUYkf1Pn/zcJAGBHT21GWLdF4GBBOJX+i2JoTlkc4JzAp6+GEHO3V73uvuQOSZLRqnjXu4ug==
X-Received: by 2002:ac8:7f0f:0:b0:444:c25f:b017 with SMTP id
 d75a77b69052e-447bf662df4mr7348641cf.2.1719977846069;        Tue, 02 Jul
 2024 20:37:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719977846; cv=none;        d=google.com;
 s=arc-20160816;
 b=eJrzuJMteeNzUR70+uyvZESP40NfKe7yyYXwpdQtdIDomA+xaRuqZZSSsgyK9nR/dO
 QJH+ibJfKzfBwYbMVmYvEcgwKYh/m14Vuoubp85XAeWMuCIkGjOK9SPDeCf0haQIqUt2
 qQdZrjHRBEUtr6uL+DkLy4zBriiZF0jQKfH8/xDoZ3QK+JCRHjPW/wNplhn9yfP0WBWb
 h9gQcLd6FybJLqTZefpVOtWl3ZgzuPkU8fggNEF4NksQ7kF6KDMnKX7MkFO6t+ONMkLG
 bukaUXBtpcMDAKkH5vVE3Gse9ioxwY9yg+tCr9cDH7tlBMbeoyTfQhnI4mlAX7p+rlRM psyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20160816;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :dkim-signature; bh=nh7PImwmAn2Ap5B0zJPKzA54WlJf7N6OhphWCdGuR5w=;
 fh=STwU/6nAwSVI2oUzRWkoH/BhmoKW+LI2Ifd8kl7IM00=;
 b=NV6sKWD0Swj0ymoP99sF9rU5fi1GWAJruYRYdL5Ym5QUXUnsQWKl9TPhitykTzbhCZ
 nie0TYha7iN1YTqNCLWHtAT29tQmtBSuQMusenjMU33ZK+DcKn7N8YShVmJGJXoyZ5vP
 uvE2TrH/znkhSgJUkA/J11JFq9++5aGzcqQa/xYbstAOwn8ufOstdpgcwNWVyM8EdxTl
 f4vhKEaGBbGFIjN/X2nxgdPyQenxYI9UqJwgBaxEHqpBugWm+jRBXymq46h9zuR+RSmj
 wTLOwFhl7fNRwFm+/9+7WCdfg6VGYX8Bay56sXVbU+NNwp+1mjy9t5y4GryaBnWCysMa OGbA==;
 dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;       dkim=pass
 header.i=@intel.com header.s=Intel header.b=kaAT9usg;       spf=pass
 (google.com: domain of lkp@intel.com designates 198.175.65.18 as permitted
 sender) smtp.mailfrom=lkp@intel.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=intel.com
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.18]) by
 mx.google.com with ESMTPS id
 d75a77b69052e-446513e5072si118837321cf.181.2024.07.02.20.37.25        for
 <dan.carpenter@linaro.org>        (version=TLS1_2
 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);        Tue, 02 Jul 2024
 20:37:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of lkp@intel.com designates
 198.175.65.18 as permitted sender) client-ip=198.175.65.18;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;  d=intel.com;
 i=@intel.com; q=dns/txt; s=Intel;  t=1719977846; x=1751513846;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=rHcj1Kcq9By3ux2PDlMkBMhkOsjBt8zBjfEYBPmBhpc=;
 b=kaAT9usgVt1KEItTNrXYNWy5h72l0ezRMwaHCcd2p6FaEysbQJDS8c/k
 wnszB6eH+QUijsUWkVhUGehZm18zTu0h3bBiVmaqyk8qV0Fa8tYVpNFGr
 +7DkaLU0jUIRLaBBcbDKGN7hkP6YkLw2A0KOBZA4EPLGN3bF2DYU3KfaU
 UwFhgYfEu1mMN/Pxv1RFcTfOmCsgU0DoyB9XlE2ngiWtafdBeiGgdksE+
 Pui10uwZIxJp/FObquamyrLhD+JcLsbVJxmEviFNPlTlI3szPt0QmVUzN
 Ed1At2EUQLdIV9RpAJ1wcX31YVAq8fOqT+7DDTq/hyUlHuwk7fUbS3dNo   g==;
X-CSE-ConnectionGUID: YgKb5HDfQqqXwVrUra9CCQ==
X-CSE-MsgGUID: OdxmyPxKTimXbwolzeNzbw==
Received: from fmviesa001.fm.intel.com ([10.60.135.141])  by
 orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul
 2024 20:37:24 -0700
X-CSE-ConnectionGUID: IwPoW7WZRZ6BAKqrpcuPIA==
X-CSE-MsgGUID: 1AkQ2h/5Q0KsT4UhziROMw==
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b)
 ([10.239.97.150])  by fmviesa001.fm.intel.com with ESMTP; 02 Jul 2024
 20:37:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96) (envelope-from
 <lkp@intel.com>) id 1sOqo5-000PDn-1M; Wed, 03 Jul 2024 03:37:21 +0000

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Anna-Maria Behnsen" <anna-maria@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/anna-maria/linux-devel.git timers/misc
head:   a75487ea30d064b9ff2bb081ff82696ae9e97014
commit: 7566dd71b07f51730aec154322a3426784a17478 [5/8] timers/migration: Read childmask and parent pointer in a single place
config: x86_64-randconfig-161-20240703 (https://download.01.org/0day-ci/archive/20240703/202407031108.pd47N271-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407031108.pd47N271-lkp@intel.com/

smatch warnings:
kernel/time/timer_migration.c:539 __walk_groups() warn: variable dereferenced before check 'group' (see line 538)

vim +/group +539 kernel/time/timer_migration.c

8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  525  static void __walk_groups(up_f up, struct tmigr_walk *data,
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  526  			  struct tmigr_cpu *tmc)
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  527  {
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  528  	struct tmigr_group *child = NULL, *group = tmc->tmgroup;
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  529  
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  530  	do {
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  531  		WARN_ON_ONCE(group->level >= tmigr_hierarchy_levels);
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  532  
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  533  		if (up(group, child, data))
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  534  			break;
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  535  
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  536  		child = group;
8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  537  		group = group->parent;
7566dd71b07f517 Anna-Maria Behnsen 2024-06-25 @538  		data->childmask = group->childmask;
                                                                                  ^^^^^^^^^^^^^^^^^
Dereference

8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25 @539  	} while (group);
                                                                 ^^^^^
Check for NULL after a dereference

8d3c19ba160fa10 Anna-Maria Behnsen 2024-06-25  540  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

