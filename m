Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7FC8F4D;
	Tue, 11 Apr 2023 15:53:46 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id w21so7969407wra.4;
        Tue, 11 Apr 2023 08:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681228424; x=1683820424;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gBGL+Im1rox4Uv0NK/kcpdR4O0HNqrG2SVFh/C2ggpU=;
        b=PUqDr0mHiWFNGwyyMCM8VeXO9RJegj/pEVno3lflcjqi5+kH9iu3tWUolnloJsXWzh
         sdiMlyCt2XxcIcy6aAkJx73WLiagB4tcLA1oMyyNvlkcxd7IDJWNLIh/cHr5WA203F31
         3XdIcEJhDkPfzgQvki6I2mWlntVfhqCZnQ21LhB1Ii1zyH3lD7sAumaZaAxqF6t2Jqum
         wwTQFzsaS+E1jg4f/glpl5o+TpJn2ghZ2uo0Q/TzLappUACNRoLJnBC0E9VQY42w6Ag6
         ogK+OrwwqJSYazNgkjRsjXU3kJCu3ZWEriuzhtdYTHn188tBwdPJQFmmjLkMh2GlL1pr
         w55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681228424; x=1683820424;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gBGL+Im1rox4Uv0NK/kcpdR4O0HNqrG2SVFh/C2ggpU=;
        b=RgtKj1/jtix/x1OHMTcEICEHEZkKJ5sVsiTKqTICRYn7mVfDT0z17rT5WJfKyGaLbC
         oDvcauajgWDBCi7bpruqCUeNjImGk9wM4NyAoySDB9fWo84/Q9+6qVFjnvHtoyk5POaR
         2Ntl9174EXNnPtLGMGKj6X5IIuMwZAtPaqKJnuosOCykCqjIcfj8fiuJGRNJZJJiXgri
         DgHOshdbUSyFCvm3/SeV9hg5dXc+AsG4Za6W7JeK/mH1oowJZRPtZRc4BYawCQfpZhCb
         /psSuv1PPTfXnfWemH3OVuYBR8tG/jEaA85W+C4LhMrc0xquFVxxe5to2ioe9M62qxKv
         LNYA==
X-Gm-Message-State: AAQBX9fO4Aw1pCVK8F4QlwI7UjRn3wPnF5ewVCKfOHbekfke1m98Nl6X
	dRVIB7XuPqqoHJ/540qpQ/wT6wIhSvQ=
X-Google-Smtp-Source: AKy350aMrrtErrZvG8A0vET19FgxoAynSgCjpuQRE0JbWNHiDufHzNtsQ3ArPWPoI+x9ITQDjc84Eg==
X-Received: by 2002:adf:fd91:0:b0:2f2:a03f:605f with SMTP id d17-20020adffd91000000b002f2a03f605fmr2500037wrr.63.1681228424395;
        Tue, 11 Apr 2023 08:53:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c4-20020a5d5284000000b002d1801018e2sm14880727wrv.63.2023.04.11.08.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 08:53:43 -0700 (PDT)
Date: Tue, 11 Apr 2023 18:53:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-filter-upstream 12/39] drivers/acpi/dalt.c:122
 parse_dalt_table() error: uninitialized symbol 'devid'.
Message-ID: <5bbbadeb-bd05-41e3-a100-aafa0fc38e66@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter-upstream
head:   359e363de7b2f8863a0cbfb771cceaefb7a80873
commit: 7930762a9eb63a3bfb1fc6fdc1ab121e926d00d6 [12/39] ACPI: DALT: Add support to parse DALT ACPI table
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230411/202304112205.SpBYYgia-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304112205.SpBYYgia-lkp@intel.com/

smatch warnings:
drivers/acpi/dalt.c:122 parse_dalt_table() error: uninitialized symbol 'devid'.

vim +/devid +122 drivers/acpi/dalt.c

7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   77  static int parse_dalt_table(struct acpi_table_dalt *dalt)
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   78  {
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   79  	struct acpi_dalt_device *ddev = (struct acpi_dalt_device *)dalt->devices;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   80  	u32 max_size = dalt->header.length - sizeof(*dalt) - sizeof(*ddev);
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   81  	struct pci_device_id *pci_id;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   82  	unsigned int vendor, device;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   83  	int fields, ret = 0;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   84  	u32 curr_size = 0;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   85  	void *devid;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   86  	char *id;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   87  
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   88  	while (curr_size <= max_size ) {
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   89  		pr_debug("Device type:%d len:%d name:%s\n", ddev->type,
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   90  			 ddev->len, ddev->name);
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   91  
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   92  		id = NULL;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   93  		pci_id = NULL;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   94  
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   95  		if (ddev->type == ACPI_DALT_PCI_DEV) {
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   96  			fields = sscanf(ddev->name, "%x:%x", &vendor, &device);
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   97  			if (fields == 2) {
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   98  				pci_id = kzalloc(sizeof(*pci_id), GFP_KERNEL);
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   99  				if (!pci_id) {
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  100  					ret = -ENOMEM;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  101  					goto parse_failed;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  102  				}
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  103  				pci_id->vendor = vendor;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  104  				pci_id->device = device;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  105  				pci_id->subdevice = PCI_ANY_ID;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  106  				pci_id->subvendor = PCI_ANY_ID;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  107  				devid = pci_id;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  108  			} else {
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  109  				pr_warn("Invalid PCI device %s\n", ddev->name);

devid not initialized on this path.

7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  110  			}
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  111  		} else if ((ddev->type == ACPI_DALT_ACPI_DEV) ||
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  112  			   (ddev->type == ACPI_DALT_PLATFORM_DEV)) {
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  113  			id = (char *)kzalloc(ddev->len, GFP_KERNEL);
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  114  			if (!id) {
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  115  				ret = -ENOMEM;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  116  				goto parse_failed;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  117  			}
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  118  			strcpy(id, ddev->name);
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  119  			devid = id;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  120  		}
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  121  
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10 @122  		ret = add_da_bus_node(ddev->type, devid);
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  123  		if (ret)
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  124  			goto parse_failed;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  125  
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  126  		curr_size = curr_size + sizeof(*ddev) + ddev->len;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  127  		ddev = (struct acpi_dalt_device *)(dalt->devices + curr_size);
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  128  	}
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  129  
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  130  	return 0;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  131  
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  132  parse_failed:
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  133  	kfree(id);
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  134  	kfree(pci_id);
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  135  	free_da_bus_list();
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  136  	return ret;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  137  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

