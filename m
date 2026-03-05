Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8238739F182
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 12:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772714927; cv=none; b=aHlnuXJXwIYfZ9p9QlFMOeU0K+NpmzKEUUB27Y3Nw4yfB2QZoLOtt4c0Gv1rQ818LpIGT3jc4n/qS7azPazmxuIK9WMrnceXh6jZAjd03s8REVQ4xCxmSFQ+nrl9xKpe3xgcNnjh990el1NuWniOdQmGYQe+u8Pku8FeVXHP+js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772714927; c=relaxed/simple;
	bh=xgkABJ9B8ONELAl8NPb+eTgwheFOkrLUjxqole2DWOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AQL41a152wCzemrUx4uuq4vkkfI4JyX3G9m8UcLPEWHgnKO4fOfRue18g2e91GdJ1OGAA22ps9RJU/bXQzNbBPvyCKy9WqvPW16PhStqZ4p07W5UMM0h8ZcRkRi5QJ0tpBTFRfWyS0TuStAb+FhlVP4t3OSEaSG82jbbA0QcRMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nm4XaUZW; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nm4XaUZW"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4837584120eso60683665e9.1
        for <oe-kbuild@lists.linux.dev>; Thu, 05 Mar 2026 04:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772714924; x=1773319724; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bF3Jt8+kZfWxPSpR81XkdalwEBQNNmKeqG6z7c/Rlac=;
        b=Nm4XaUZW57eD/KuVSMY9vP3uMkpNsiqdyLH6wDtv3Ik7rYMGxjXYGs68Cdn3BYmxzy
         Yq0Yf0ys5qtEB8t9QNsUDsEpkda58K7Td8QtDmJYUcR4LAoxuC5C0tJGThmuDPYo+Zba
         SU0dvR+/MV2KwGFEAUJ+iYbU+6S22WKEsJ3rXnPYeD10XB8gqUD7OmYfftt2gIRBJNoq
         OBbNhNAQYIJK58LQs0zSiFNPkkt/M2TkT4lY4I6s29K76qlGMBweMtJ9/SdpsJmyp9ve
         4eZTTC5T9sT2NOKOAy6AzTFsxJ6/hbNT0JzUd6sY2S9WBLq0OPDAvqzCxut3ncfpVGO9
         0Vhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772714924; x=1773319724;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bF3Jt8+kZfWxPSpR81XkdalwEBQNNmKeqG6z7c/Rlac=;
        b=mFi4UcYbnEFBb0j972VwhWMjjumvqvP3kZ8R5CXrkwHJTqAQ2i+H/KE9C7jFFkxRG8
         q+OCxFYGj4+HAQkr5s+7E90maIDrDiOGNlN/A/w8uWqyLnhVKLt+i/wag3kQZm2WDA8T
         N/zYB79V/r0gIlxzLpfWYLiZT34wCkLF+09gzgdHkszrnFcIzXZpB4xfSdP/U+IwpyOf
         nsPDS1cB6RsUO3voa91Lxxr0h+XmCYAc6aAxMQzIen0N4PCIQbTR6FDSci90BGrLQaak
         9kncK79F38LTr/FmjaE8ZgbsL0AtailHvx+qvhTdIzI4gble4aFNg5IxTDsW1epEloPA
         bcqg==
X-Gm-Message-State: AOJu0YxoOfjWmX9y6kjC2RTiBJBamjUaBBxZClaprJBi64qG60XVoo/+
	Uv4KCGFe9VTdiGCjA4blAyoWnuA6WebYyert+pOF5bLKcqlMuONGfvEVahL0QFMyEpBqLXRCIU8
	CS8Gk
X-Gm-Gg: ATEYQzznrXtag5ROy+XtJsm1NklMP+6H4UKMAc02zmBM8p4GCrgKr/Tmv4Gq0Hwryum
	tgbgFQJS1enNr4SG3P6H8fic+gJopHY9MGc0U0NIuLHq2zfNhg5u+YfLYgEykVwi7/UZ/rybPOr
	iaPrOaCLvrJPI6MWvEjaDnj+NMLHFkCK+t9414BRfTCthaNQFFuKXoWiwy9DqS7Yfb6y9Sfr+U0
	eoL61mGL8Ahm07FW520FEH2hOtLQkcZ+hfFrF07LXKykKfP9BBFwvPB95KkwtapGaXcKdl6tRDA
	5Ci/W+dd1VPPUSWcc8ESNtZahHZc9BWZ/gSjhriopafef9OE3+sJcQ8QAPndc6rfX58zzRHKSW7
	VTTcTQHnWsAK1nuej/UyC9tW5pvdrY//OY3K5rZ/m2TRVdgAk3Jch6/FQyhCi7mvq9snAXfrLkg
	ASJWHSLHDJU85c5iZUSzDmz929hOFu2XNqju4p3BY=
X-Received: by 2002:a05:600c:6389:b0:480:4b5d:9ec with SMTP id 5b1f17b1804b1-485198a3c2cmr91882675e9.33.1772714923573;
        Thu, 05 Mar 2026 04:48:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851a895553sm92101715e9.1.2026.03.05.04.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 04:48:43 -0800 (PST)
Date: Thu, 5 Mar 2026 15:48:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Farhan Ali <alifm@linux.ibm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [pci:wip/2603-farhan-s390-err-v10 1/9] drivers/pci/slot.c:40
 address_read_file() warn: impossible condition '(slot->number == -1) =>
 (0-u16max == (-1))'
Message-ID: <202603051816.NIWQx7m0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20260305124840.l6RmfUkMn5hSEV3xvKdhpf4Gv4Xfokih0BFuM5GvEHI@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git wip/2603-farhan-s390-err-v10
head:   d72875f0a4958f51f7196e6fada9357799418a52
commit: 77c0762d2e847cf2e8d6d79e6f88a1c2b1ca4d06 [1/9] PCI: Allow per function PCI slots
config: i386-randconfig-r071-20260305 (https://download.01.org/0day-ci/archive/20260305/202603051816.NIWQx7m0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603051816.NIWQx7m0-lkp@intel.com/

smatch warnings:
drivers/pci/slot.c:40 address_read_file() warn: impossible condition '(slot->number == -1) => (0-u16max == (-1))'

vim +40 drivers/pci/slot.c

f46753c5e354b8 Alex Chiang          2008-06-10  38  static ssize_t address_read_file(struct pci_slot *slot, char *buf)
f46753c5e354b8 Alex Chiang          2008-06-10  39  {
77c0762d2e847c Farhan Ali           2026-03-02 @40  	if (slot->number == -1)
                                                            ^^^^^^^^^^^^^^^^^^
u16 can't be -1.

f8cf6e513ec4f0 Krzysztof Wilczyński 2021-06-03  41  		return sysfs_emit(buf, "%04x:%02x\n",
f46753c5e354b8 Alex Chiang          2008-06-10  42  				  pci_domain_nr(slot->bus),
f46753c5e354b8 Alex Chiang          2008-06-10  43  				  slot->bus->number);
f8cf6e513ec4f0 Krzysztof Wilczyński 2021-06-03  44  
f8cf6e513ec4f0 Krzysztof Wilczyński 2021-06-03  45  	return sysfs_emit(buf, "%04x:%02x:%02x\n",
f46753c5e354b8 Alex Chiang          2008-06-10  46  			  pci_domain_nr(slot->bus),
f46753c5e354b8 Alex Chiang          2008-06-10  47  			  slot->bus->number,
f46753c5e354b8 Alex Chiang          2008-06-10  48  			  slot->number);
f46753c5e354b8 Alex Chiang          2008-06-10  49  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

