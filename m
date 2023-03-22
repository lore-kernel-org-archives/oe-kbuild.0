Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B6C1FB1;
	Wed, 22 Mar 2023 08:07:17 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id b20so36387557edd.1;
        Wed, 22 Mar 2023 01:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679472436;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uDLy6gXwopARuTlfqgOxRX3tSQF+2gi6u0FbFURqkMs=;
        b=TbpxK+Kj5hBU/t7V/bNNwtnWIt+6XtX+jmwCZf0otN1AJnWtQEXtFOX9ps1Wy3aOlm
         99StdSC7NqHD/I1Sa6B9RYrPNVRo4V8PPi2h7MEE5e47svEcr0FC8Tg+9sRaX14+Q/uJ
         OtJhGLVuz1s5hYuKl+J8vCv2aPf0S+dD9UBdIkI5rSI24Ins5+XhwRqmee3eXH6grZUI
         CyawVtJzbUECUIwo3rksYgvl0wiISbYa5rq51K5NM8ByInkrCOB+e1YYRxqa5PxqujNH
         Cnj/A5uVMN1DigvxGgw7th2QCew5OH0Agwvqn6IvKZXySHugzmHbBq5hNwwFyF/UVLnO
         AdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679472436;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDLy6gXwopARuTlfqgOxRX3tSQF+2gi6u0FbFURqkMs=;
        b=mBhrHcpo8mXBXiwRm0/7/jTy6pBrKlc7WaV4uTUpzHr3InxvofTCg3R90BZmi9+FIZ
         ZGiTGzHE5wzOJPG8asqGkDU/7RDKFheiBaCN37IO1RYNA+q99w5bIO3nKSMaMcaEfTJT
         Ef1D58vjulNarEoDdxbq69eWPrZkhD3xAc/QkrSez0gW9niyyyNTsoE1U4wKxSro1YTw
         PSsBk1QVThX1hBrw/oaqDvTg4RxwPbcZvKrFiH7a1Czuo7swpsSTXQfEmijn1qzbaw4A
         mLJN89gJ5E8b69jWMgw/nrAB+4gVmWkwhPS6xYAOayDtLi5Lks3NB0qdCq2cMKt6j4QC
         Ga0Q==
X-Gm-Message-State: AO0yUKWvr4zvzCpy9Rs617f0X7/sPdWuAAQm0+e8zYAFEEaYejBV4rjL
	yxNjlJyaEXW0in5hr2m5uwDBVkrX8AA=
X-Google-Smtp-Source: AK7set91PeT1rns8zGWrRzVqfZS5PLsJGVSf/j1OePGS0f7y1hnEHyGgIpr/NupFZ+AmDUGtUMiU1A==
X-Received: by 2002:aa7:c84e:0:b0:4fa:b302:84d9 with SMTP id g14-20020aa7c84e000000b004fab30284d9mr5948545edt.14.1679472435784;
        Wed, 22 Mar 2023 01:07:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u3-20020a50d503000000b004fcd78d1215sm7371005edi.36.2023.03.22.01.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 01:07:14 -0700 (PDT)
Date: Wed, 22 Mar 2023 11:07:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Zhang Rui <rui.zhang@intel.com>,
	linux-pm@vger.kernel.org, rafael.j.wysocki@intel.com,
	daniel.lezcano@linaro.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thermal/core: update cooling device during thermal zone
 unregistration
Message-ID: <a6d760f9-18a0-4bcd-a3ce-ab2b9db53c7c@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321154627.17787-1-rui.zhang@intel.com>

Hi Zhang,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhang-Rui/thermal-core-update-cooling-device-during-thermal-zone-unregistration/20230321-234754
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20230321154627.17787-1-rui.zhang%40intel.com
patch subject: [PATCH] thermal/core: update cooling device during thermal zone unregistration
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230322/202303221159.6cdRxcUo-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303221159.6cdRxcUo-lkp@intel.com/

smatch warnings:
drivers/thermal/thermal_core.c:1436 thermal_zone_device_unregister() warn: iterator used outside loop: 'ti'

vim +/ti +1436 drivers/thermal/thermal_core.c

203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1402  void thermal_zone_device_unregister(struct thermal_zone_device *tz)
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1403  {
a5f785ce608caf drivers/thermal/thermal_core.c Dmitry Osipenko  2020-08-18  1404  	int i, tz_id;
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1405  	const struct thermal_zone_params *tzp;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1406  	struct thermal_cooling_device *cdev;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1407  	struct thermal_zone_device *pos = NULL;
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1408  	struct thermal_instance *ti;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1409  
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1410  	if (!tz)
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1411  		return;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1412  
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1413  	tzp = tz->tzp;
a5f785ce608caf drivers/thermal/thermal_core.c Dmitry Osipenko  2020-08-18  1414  	tz_id = tz->id;
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1415  
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1416  	mutex_lock(&thermal_list_lock);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1417  	list_for_each_entry(pos, &thermal_tz_list, node)
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1418  		if (pos == tz)
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1419  			break;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1420  	if (pos != tz) {
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1421  		/* thermal zone device not found */
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1422  		mutex_unlock(&thermal_list_lock);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1423  		return;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1424  	}
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1425  	list_del(&tz->node);
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1426  
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1427  	/* Unbind all cdevs associated with 'this' thermal zone */
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1428  	list_for_each_entry(cdev, &thermal_cdev_list, node) {
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1429  		mutex_lock(&tz->lock);
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1430  		list_for_each_entry(ti, &tz->thermal_instances, tz_node) {
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1431  			if (ti->cdev == cdev)
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1432  				break;
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1433  		}
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1434  
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1435  		/* The cooling device is not used by current thermal zone */
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21 @1436  		if (ti->cdev != cdev) {

Here we are testing to see if the loop exited by hitting the break.  If
the condition is != then "ti" is not a valid pointer and it's kind of an
out of bounds access.  I used to fix these with:

-	if (ti->cdev != cdev) {
+	if (list_entry_is_head(ti, &tz->thermal_instances, tz_node)) {

But these days we just prefer using a found variable:

	found = false;
	list_for_each_entry(ti, &tz->thermal_instances, tz_node) {
		if (ti->cdev == cdev) {
			found = true;
			break;
		}
	}
	if (!found) {

55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1437  			mutex_unlock(&tz->lock);
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1438  			continue;
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1439  		}
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1440  		mutex_unlock(&tz->lock);
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1441  
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1442  		if (tz->ops->unbind) {
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1443  			tz->ops->unbind(tz, cdev);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

