Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20397B;
	Sat, 11 Mar 2023 12:36:10 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id l1so7390693wry.12;
        Sat, 11 Mar 2023 04:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678538169;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xbudqc+X9nQFu7LvEovdqULMbT6ys9vA1FimI/Gc8HI=;
        b=CBig7JRmIh/kblQwrj/koR1QGPirr1tBnKUOWoeAIN2GvFSyI79mJ3MEuT+OVEEI21
         2B5L5S9+jwdSUsnASWa9i0ya9XT3neWJwWh7mXu6nvvBONL1gblfKYms8MOobsTae0/c
         f73068OBNefQ3IotKQjS4chkRkI+f+E3JYk/A+j1O/lKm+61Jh+y01UH+mMbY2EgPTbp
         XY2P3BH9R/UMEwBLVtPsZxI/xU5AEvDsXdTwVYC1kd1Q2g1leVvTGiL9D+ACaw5IYy9u
         50sJAhTo7PLB9TiLYTBx5s6r3U/OCDmxRyynaLDmzC/awg+r8p3lfaQBrbsG0+C31Pqp
         FKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678538169;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xbudqc+X9nQFu7LvEovdqULMbT6ys9vA1FimI/Gc8HI=;
        b=MqF9rqbNKWU+1AkPns1tvLnA2jR1A6i//yr9TAeWZ/vEgvbLsttOcrX/mM8zIzFVAR
         WuFlXs5bFvBB8xAqMp4qdGjTpEHnB8emsFT/9AneekqbLrovIq6iO43YnQxq/NQInUs+
         CmGjIqeQ1Mpm7Hro0jS6Knny0H+fC79zwxvULK15vbSBXg2VQVVVK0qY4qdwVHzc2zPH
         x1rvCChPdj+V1xRIVG6A5B/6KIBp6MOBZdTyhAQrjo/T4KQ26d6PuZoqBrXhvLSsC69b
         CRJWgZ/gCp13nyab8zDAH6Cdkh6SRFEbOA05VPU5+87C5aCiyXjzSVqFzGX/o0FsKffl
         TgoQ==
X-Gm-Message-State: AO0yUKVqA1EpZNuSKKpgALBX/vnWzGQn4DarOdh60lHqNJvrFxyAV0Ob
	OiXlUFOjQD3QpdCnjFR5Hb5GwS6LBCokO0lE
X-Google-Smtp-Source: AK7set8+68NgFBmkUTQJ+QCHQTKCXTskWK0JnVngMy13TLfwfrXl0rHJhkZSziFFv6OutMxHes44GA==
X-Received: by 2002:a5d:664e:0:b0:2c5:3ccf:e99a with SMTP id f14-20020a5d664e000000b002c53ccfe99amr19361166wrw.6.1678538168811;
        Sat, 11 Mar 2023 04:36:08 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h11-20020adff4cb000000b002c70ce264bfsm2400063wrp.76.2023.03.11.04.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 04:36:08 -0800 (PST)
Date: Sat, 11 Mar 2023 15:36:03 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Ondrej Zary <linux@zary.sk>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>
Subject: drivers/ata/pata_parport/pata_parport.c:446 pi_init_one() warn:
 possible memory leak of 'pi'
Message-ID: <3ab89ddc-cb60-47c4-86ad-cdad94a8a3d7@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ef5f68cc1f829b492b19cd4df5af4454aa816b93
commit: 72f2b0b2185099dce354c805009f591dda3ab73d drivers/block: Move PARIDE protocol modules to drivers/ata/pata_parport
config: ia64-randconfig-m041-20230308 (https://download.01.org/0day-ci/archive/20230311/202303111822.IHNchbkp-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303111822.IHNchbkp-lkp@intel.com/

New smatch warnings:
drivers/ata/pata_parport/pata_parport.c:446 pi_init_one() warn: possible memory leak of 'pi'
drivers/ata/pata_parport/comm.c:64 comm_read_regr() warn: inconsistent indenting
drivers/ata/pata_parport/comm.c:164 comm_write_block() warn: inconsistent indenting

Old smatch warnings:
drivers/ata/pata_parport/pata_parport.c:445 pi_init_one() warn: unsigned 'pi->dev.id' is never less than zero.
drivers/ata/pata_parport/comm.c:168 comm_write_block() warn: inconsistent indenting
drivers/ata/pata_parport/comm.c:172 comm_write_block() warn: inconsistent indenting

vim +/pi +446 drivers/ata/pata_parport/pata_parport.c

246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  418  static struct pi_adapter *pi_init_one(struct parport *parport,
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  419  			struct pi_protocol *pr, int mode, int unit, int delay)
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  420  {
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  421  	struct pardev_cb par_cb = { };
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  422  	char scratch[512];
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  423  	const struct ata_port_info *ppi[] = { &pata_parport_port_info };
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  424  	struct ata_host *host;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  425  	struct pi_adapter *pi;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  426  	struct pi_device_match match = { .parport = parport, .proto = pr };
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  427  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  428  	/*
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  429  	 * Abort if there's a device already registered on the same parport
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  430  	 * using the same protocol.
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  431  	 */
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  432  	if (bus_for_each_dev(&pata_parport_bus_type, NULL, &match, pi_find_dev))
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  433  		return NULL;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  434  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  435  	pi = kzalloc(sizeof(struct pi_adapter), GFP_KERNEL);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  436  	if (!pi)
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  437  		return NULL;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  438  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  439  	/* set up pi->dev before pi_probe_unit() so it can use dev_printk() */
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  440  	pi->dev.parent = &pata_parport_bus;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  441  	pi->dev.bus = &pata_parport_bus_type;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  442  	pi->dev.driver = &pr->driver;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  443  	pi->dev.release = pata_parport_dev_release;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  444  	pi->dev.id = ida_alloc(&pata_parport_bus_dev_ids, GFP_KERNEL);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  445  	if (pi->dev.id < 0)
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23 @446  		return NULL; /* pata_parport_dev_release will do kfree(pi) */

The comment says that pata_parport_dev_release() will free "pi" but
that's impossible because pi is a local variable and we haven't called
device_register().

246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  447  	dev_set_name(&pi->dev, "pata_parport.%u", pi->dev.id);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  448  	if (device_register(&pi->dev)) {
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  449  		put_device(&pi->dev);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  450  		goto out_ida_free;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  451  	}
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  452  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  453  	pi->proto = pr;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  454  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  455  	if (!try_module_get(pi->proto->owner))
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  456  		goto out_unreg_dev;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  457  	if (pi->proto->init_proto && pi->proto->init_proto(pi) < 0)
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  458  		goto out_module_put;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  459  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  460  	pi->delay = (delay == -1) ? pi->proto->default_delay : delay;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  461  	pi->mode = mode;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  462  	pi->port = parport->base;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  463  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  464  	par_cb.private = pi;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  465  	pi->pardev = parport_register_dev_model(parport, DRV_NAME, &par_cb,
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  466  						pi->dev.id);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  467  	if (!pi->pardev)
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  468  		goto out_module_put;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  469  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  470  	if (!pi_probe_unit(pi, unit, scratch)) {
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  471  		dev_info(&pi->dev, "Adapter not found\n");
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  472  		goto out_unreg_parport;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  473  	}
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  474  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  475  	pi->proto->log_adapter(pi, scratch, 1);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  476  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  477  	host = ata_host_alloc_pinfo(&pi->pardev->dev, ppi, 1);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  478  	if (!host)
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  479  		goto out_unreg_parport;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  480  	dev_set_drvdata(&pi->dev, host);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  481  	host->private_data = pi;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  482  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  483  	ata_port_desc(host->ports[0], "port %s", pi->pardev->port->name);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  484  	ata_port_desc(host->ports[0], "protocol %s", pi->proto->name);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  485  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  486  	pi_connect(pi);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  487  	if (ata_host_activate(host, 0, NULL, 0, &pata_parport_sht))
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  488  		goto out_unreg_parport;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  489  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  490  	return pi;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  491  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  492  out_unreg_parport:
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  493  	pi_disconnect(pi);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  494  	parport_unregister_device(pi->pardev);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  495  	if (pi->proto->release_proto)
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  496  		pi->proto->release_proto(pi);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  497  out_module_put:
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  498  	module_put(pi->proto->owner);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  499  out_unreg_dev:
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  500  	device_unregister(&pi->dev);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  501  out_ida_free:
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  502  	ida_free(&pata_parport_bus_dev_ids, pi->dev.id);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  503  	return NULL;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  504  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

