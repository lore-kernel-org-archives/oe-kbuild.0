Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D5E2AB4F
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Jul 2023 13:37:06 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso7216892f8f.0
        for <oe-kbuild@lists.linux.dev>; Wed, 12 Jul 2023 06:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689169023; x=1691761023;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7aIsCgAEppDTo87SF0nTw6+UTGDKYZtSnvTAef+gOT4=;
        b=EZeovcCJRb22vO8l93sN8nUXkydJlOcD0nUt9COZhB92H+jIuY6LRMNruXUFuhmTfS
         S6b79kN/PGUQ+FUU0m5iOYzTU+jJYcSOx/Dlojn0PGL1OWbrvU7FwAHDZ50Dyogp0geR
         SvtlsJziNxh+sOU+ah+pbou4CEGlObgsGKwPPXCjk4qm0RxAUhNUWhsQzet/pnLlFiqc
         OjXmOimTHg6DpMnAg/U1us8gY3rBqLY8b2VoIBN0Xsv/Yd8HNQkDY0COr3TrXTnd0cEB
         1o6YILHJI9RIniC2esLGATJRVGEINQHKCTM3HsXl4L3tOs6IDu04DRfm6m80mhEzxvmz
         eLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689169023; x=1691761023;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7aIsCgAEppDTo87SF0nTw6+UTGDKYZtSnvTAef+gOT4=;
        b=a6AoEW8Pc8XH8YanPaLtnZShU/2Ps20h+tm1GZklQ0Hj/I3hHAqKJ0uq37Co5tLXQz
         Q9aM9mbrKsZiCBXH0tzENIOsQAWnEZ+5TCS8S7PwUf8LgIH20wKTILWDUdk7sCwLSU3I
         VqnyYo6Kn84Z0oK/Yv0oXX81NPAXc1OAl9RV/3Tq83tUEPvnenABPQEqL8M06ojhz58p
         XmtNRVasRLsySqF+iXY37qGYds8rjuRKkYMxciO88abf6c3Z8A3fW6tBjn8X0/QrFxqK
         NKJ3D6ULsjfG25bEUF3d49O62TJdVuH3o3hW82gesh4wN8ICSmk2hOWlw/EpuxrPGMyo
         jqVw==
X-Gm-Message-State: ABy/qLbXrq9lgYWb9b9KQlGsAcV00Qv3qKRE9Td/o2tmzh/FHQlEVHqx
	+ajVjtptrWJJOKEjvjxnCm/AsyNoeLUgw0syj8I=
X-Google-Smtp-Source: APBJJlFfWPEH5aJKXahNUW4XOD9+F38TUViK/4xi8D88ZoAGAkC+NYbUQV91fwqACh4OhQggIyYvgQ==
X-Received: by 2002:a05:6000:196e:b0:314:1648:9d7d with SMTP id da14-20020a056000196e00b0031416489d7dmr17786193wrb.64.1689169023539;
        Wed, 12 Jul 2023 06:37:03 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600000ce00b003062b2c5255sm5153502wrx.40.2023.07.12.06.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 06:37:01 -0700 (PDT)
Date: Wed, 12 Jul 2023 16:36:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Utkarsh Patel <utkarsh.h.patel@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/2] platform/chrome: cros_ec_typec: Configure Retimer
 cable type
Message-ID: <18933ae4-e110-4eec-af23-ceb39f83821d@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628173727.701140-2-utkarsh.h.patel@intel.com>

Hi Utkarsh,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Utkarsh-Patel/platform-chrome-cros_ec_typec-Configure-Retimer-cable-type/20230629-013750
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230628173727.701140-2-utkarsh.h.patel%40intel.com
patch subject: [PATCH v2 1/2] platform/chrome: cros_ec_typec: Configure Retimer cable type
config: i386-randconfig-m021-20230710 (https://download.01.org/0day-ci/archive/20230712/202307122026.7Iaz7rZa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307122026.7Iaz7rZa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202307122026.7Iaz7rZa-lkp@intel.com/

smatch warnings:
drivers/platform/chrome/cros_ec_typec.c:421 cros_typec_get_cable_vdo() warn: iterator used outside loop: 'node'

vim +/node +421 drivers/platform/chrome/cros_ec_typec.c

614bf1649c6dd4 Utkarsh Patel   2023-06-28  409  static int cros_typec_get_cable_vdo(struct cros_typec_data *typec, int port_num,
614bf1649c6dd4 Utkarsh Patel   2023-06-28  410  				    uint16_t svid)
614bf1649c6dd4 Utkarsh Patel   2023-06-28  411  {
614bf1649c6dd4 Utkarsh Patel   2023-06-28  412  	struct cros_typec_port *port = typec->ports[port_num];
614bf1649c6dd4 Utkarsh Patel   2023-06-28  413  	struct list_head *head = &port->plug_mode_list;
614bf1649c6dd4 Utkarsh Patel   2023-06-28  414  	struct cros_typec_altmode_node *node;
614bf1649c6dd4 Utkarsh Patel   2023-06-28  415  
614bf1649c6dd4 Utkarsh Patel   2023-06-28  416  	list_for_each_entry(node, head, list) {
614bf1649c6dd4 Utkarsh Patel   2023-06-28  417  		if (node->amode->svid == svid)
614bf1649c6dd4 Utkarsh Patel   2023-06-28  418  			break;
614bf1649c6dd4 Utkarsh Patel   2023-06-28  419  	}
614bf1649c6dd4 Utkarsh Patel   2023-06-28  420  
614bf1649c6dd4 Utkarsh Patel   2023-06-28 @421  	if (node->amode->svid != svid)

This doesn't work and I'm slightly surprised that it doesn't crash in
testing.  If list_for_each_entry() doesn't hit a break statement then
node points to invalid (but non-NULL) pointer.  The pointer is a offset
from &port->plug_mode_list in this case.

It should be:

	list_for_each_entry(node, head, list) {
		if (node->amode->svid == svid)
			return node->amode->vdo;
	}

	return 0;

614bf1649c6dd4 Utkarsh Patel   2023-06-28  422  		return 0;
614bf1649c6dd4 Utkarsh Patel   2023-06-28  423  
614bf1649c6dd4 Utkarsh Patel   2023-06-28  424  	return node->amode->vdo;
614bf1649c6dd4 Utkarsh Patel   2023-06-28  425  }
614bf1649c6dd4 Utkarsh Patel   2023-06-28  426  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

