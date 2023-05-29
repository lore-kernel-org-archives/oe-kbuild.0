Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A74652
	for <oe-kbuild@lists.linux.dev>; Mon, 29 May 2023 04:29:09 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-30a8fa6e6fcso1678827f8f.1
        for <oe-kbuild@lists.linux.dev>; Sun, 28 May 2023 21:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685334546; x=1687926546;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PW9rXTpogXD/rMe9cbaMBiysRT/JUDf/+coLts4mkAk=;
        b=XTJyfRnblihoDFtzh9mhJSRdZCgp07hKrxjsFXbbnKtkNsx6a9o46FYuxmXhTXWFK0
         tLaXGJ/W5jEv3WApAyiMFR/zC5IB0WJ80wlQpqBfdY5Ju0hPem/ccftWBEplV4br8SU8
         oB2WoL/jAqN+AZJ2zT01GypZ1ru+SiTmRf2coe5PgXw3b9dnHQktakEgtZs3uthaXt8c
         ixn6fHvigsfRabLtyFYcGsAYU1DHwk26PHTgT/bzfaF/mBRaQRqcKSVzWK9sHPqpjE0+
         Hl61RxFQoTSQmWPmyRenQuANC/yqKT4JNqHj+N+CHbV9wf/DBaMI+jA8hkSBdekEFz3E
         fECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685334546; x=1687926546;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PW9rXTpogXD/rMe9cbaMBiysRT/JUDf/+coLts4mkAk=;
        b=CS7oFTyqWj6G1dh7TGa4BSZ+BfE62AVpCMnQH1lBUdE6r7WcJNA9hvejLEwNMDMoq8
         6OlxD0UrTD5S6g8AdR2St+TCNL+ryM2DV7fm9HjeJsDoq+hpV1wl+TfLr1hByRSSyBFr
         T2obj7r6f4kcFdPvJWBol0BGXrYEQ2/DIi7IKsXltKkS967l64jvLPp0rSDmepYc8d+a
         o5giuS3h0f+9zGKhIiyl9jw7qPXCqtEhkrLDMpvwAU3tGs5KaBJibX5VON4HQzJO0RLd
         ukUI7pupcGH42mD0A8s8y/WJmLD1a8R+XyOo4+mlVlTdPk4zkCSmHXRlYYj5Ccm5WVd0
         z7DA==
X-Gm-Message-State: AC+VfDw2/pV8pgzp5kGQ6Z7UOxsSllZPx/56mXMkHbkPPpEZr69n45mD
	ImmW56E80DEtcbSP1HsXRVDHTCBFHlQxYxzFEJU=
X-Google-Smtp-Source: ACHHUZ74Ruy1qD4N//b4LHn76Hs7B/apj+Pk6hcrhVWNwYFuABqlUZ4+hycfm/BhR+5Q8FOAJN22Xw==
X-Received: by 2002:a5d:5274:0:b0:30a:ea63:855 with SMTP id l20-20020a5d5274000000b0030aea630855mr1578970wrc.31.1685334546387;
        Sun, 28 May 2023 21:29:06 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c4-20020adffb04000000b0030ae4350212sm5956702wrr.66.2023.05.28.21.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 21:29:04 -0700 (PDT)
Date: Mon, 29 May 2023 07:28:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Miquel Raynal <miquel.raynal@bootlin.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luka Perkov <luka.perkov@sartura.hr>,
	Robert Marko <robert.marko@sartura.hr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/2] nvmem: core: Expose cells through sysfs
Message-ID: <8c442b03-bff3-4d25-96e0-eb297e280797@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523100239.307574-3-miquel.raynal@bootlin.com>

Hi Miquel,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Miquel-Raynal/ABI-sysfs-nvmem-cells-Expose-cells-through-sysfs/20230523-203042
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20230523100239.307574-3-miquel.raynal%40bootlin.com
patch subject: [PATCH 2/2] nvmem: core: Expose cells through sysfs
config: i386-randconfig-m021-20230525 (https://download.01.org/0day-ci/archive/20230528/202305280054.NloN5RLk-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305280054.NloN5RLk-lkp@intel.com/

smatch warnings:
drivers/nvmem/core.c:380 nvmem_cell_attr_read() error: uninitialized symbol 'read_len'.

vim +/read_len +380 drivers/nvmem/core.c

22c370b2163e59 Miquel Raynal       2023-05-23  328  static struct nvmem_cell *nvmem_create_cell(struct nvmem_cell_entry *entry,
22c370b2163e59 Miquel Raynal       2023-05-23  329  					    const char *id, int index);
22c370b2163e59 Miquel Raynal       2023-05-23  330  
22c370b2163e59 Miquel Raynal       2023-05-23  331  static ssize_t nvmem_cell_attr_read(struct file *filp, struct kobject *kobj,
22c370b2163e59 Miquel Raynal       2023-05-23  332  				    struct bin_attribute *attr, char *buf,
22c370b2163e59 Miquel Raynal       2023-05-23  333  				    loff_t pos, size_t count)
22c370b2163e59 Miquel Raynal       2023-05-23  334  {
22c370b2163e59 Miquel Raynal       2023-05-23  335  	struct nvmem_cell_entry *entry;
22c370b2163e59 Miquel Raynal       2023-05-23  336  	struct nvmem_cell *cell = NULL;
22c370b2163e59 Miquel Raynal       2023-05-23  337  	struct nvmem_device *nvmem;
22c370b2163e59 Miquel Raynal       2023-05-23  338  	size_t cell_sz, read_len;
22c370b2163e59 Miquel Raynal       2023-05-23  339  	struct device *dev;
22c370b2163e59 Miquel Raynal       2023-05-23  340  	void *content;
22c370b2163e59 Miquel Raynal       2023-05-23  341  
22c370b2163e59 Miquel Raynal       2023-05-23  342  	if (attr->private)
22c370b2163e59 Miquel Raynal       2023-05-23  343  		dev = attr->private;
22c370b2163e59 Miquel Raynal       2023-05-23  344  	else
22c370b2163e59 Miquel Raynal       2023-05-23  345  		dev = kobj_to_dev(kobj);
22c370b2163e59 Miquel Raynal       2023-05-23  346  	nvmem = to_nvmem_device(dev);
22c370b2163e59 Miquel Raynal       2023-05-23  347  
22c370b2163e59 Miquel Raynal       2023-05-23  348  	mutex_lock(&nvmem_mutex);
22c370b2163e59 Miquel Raynal       2023-05-23  349  	list_for_each_entry(entry, &nvmem->cells, node) {
22c370b2163e59 Miquel Raynal       2023-05-23  350  		if (strncmp(entry->name, attr->attr.name, XATTR_NAME_MAX))
22c370b2163e59 Miquel Raynal       2023-05-23  351  			continue;
22c370b2163e59 Miquel Raynal       2023-05-23  352  
22c370b2163e59 Miquel Raynal       2023-05-23  353  		cell = nvmem_create_cell(entry, entry->name, 0);
22c370b2163e59 Miquel Raynal       2023-05-23  354  		if (IS_ERR(cell)) {
22c370b2163e59 Miquel Raynal       2023-05-23  355  			mutex_unlock(&nvmem_mutex);
22c370b2163e59 Miquel Raynal       2023-05-23  356  			return PTR_ERR(cell);
22c370b2163e59 Miquel Raynal       2023-05-23  357  		}
22c370b2163e59 Miquel Raynal       2023-05-23  358  
22c370b2163e59 Miquel Raynal       2023-05-23  359  		break;
22c370b2163e59 Miquel Raynal       2023-05-23  360  	}
22c370b2163e59 Miquel Raynal       2023-05-23  361  	mutex_unlock(&nvmem_mutex);
22c370b2163e59 Miquel Raynal       2023-05-23  362  
22c370b2163e59 Miquel Raynal       2023-05-23  363  	if (!cell)
22c370b2163e59 Miquel Raynal       2023-05-23  364  		return -EINVAL;
22c370b2163e59 Miquel Raynal       2023-05-23  365  
22c370b2163e59 Miquel Raynal       2023-05-23  366  	content = nvmem_cell_read(cell, &cell_sz);
22c370b2163e59 Miquel Raynal       2023-05-23  367  	if (IS_ERR(content)) {
22c370b2163e59 Miquel Raynal       2023-05-23  368  		count = PTR_ERR(content);
22c370b2163e59 Miquel Raynal       2023-05-23  369  		goto destroy_cell;

read_len not initialized on this goto path.

22c370b2163e59 Miquel Raynal       2023-05-23  370  	}
22c370b2163e59 Miquel Raynal       2023-05-23  371  
22c370b2163e59 Miquel Raynal       2023-05-23  372  	read_len = min_t(unsigned int, cell_sz - pos, count);
22c370b2163e59 Miquel Raynal       2023-05-23  373  	memcpy(buf, content + pos, read_len);
22c370b2163e59 Miquel Raynal       2023-05-23  374  	kfree(content);
22c370b2163e59 Miquel Raynal       2023-05-23  375  
22c370b2163e59 Miquel Raynal       2023-05-23  376  destroy_cell:
22c370b2163e59 Miquel Raynal       2023-05-23  377  	kfree_const(cell->id);
22c370b2163e59 Miquel Raynal       2023-05-23  378  	kfree(cell);
22c370b2163e59 Miquel Raynal       2023-05-23  379  
22c370b2163e59 Miquel Raynal       2023-05-23 @380  	return read_len;
                                                        ^^^^^^^^^^^^^^^

22c370b2163e59 Miquel Raynal       2023-05-23  381  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

