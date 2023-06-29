Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB2714269
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jun 2023 18:59:11 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fbc0981757so7630825e9.3
        for <oe-kbuild@lists.linux.dev>; Thu, 29 Jun 2023 11:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688065149; x=1690657149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/FlO6Jg75h7o7gINpngRzGw5kuFzFb/sRPAmynbpWL4=;
        b=WNa2WqtwhDEFGZyeP3X1GuyXVe6QeR2n2jhIdc8gOr1KXIKZ09eD1yTtWDdh1ttCv+
         s5BT2021wqRbiDHRIBJwWy80hewSh4Qo9PcZhnMN5A3PFOzrgy4vfRGjNmwvVreROl5E
         tdxHLgjPd0A+hWD59C93r6O9SSU1K/IVTxdwZxwLv/2k7ZMxhKdUeb3+XF3kEMBanxd/
         cN/jDDcfItExCzIAAe5ledowEqjq5jzrgMoDbqs+6pCfabTuySDQDdro6yOq332RV4MF
         eS40zefM0IEKgWq20lJSBDfq3AU3738aGtzH6cvCBq8UR4Om+SbolC9gbKaqijN5x6d1
         TT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688065149; x=1690657149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FlO6Jg75h7o7gINpngRzGw5kuFzFb/sRPAmynbpWL4=;
        b=ji1E0PytM+lRylv3StLw2RY7As2LhiruVVZ+ezDzT82M2pmtuPm7xlqLrcW4oYZ1rh
         Sc7tQvJYrLwvsSJetDvRaY55x3RVUfy+6vlnIZS9WiN5NS5mHnJvMWfxwkzQPmCz6BpY
         BfRp5HhkDCId6LPg4qPSJbAw8pjKxmIiPOqROxTRmSnDlsAkS0IeRSo2rxPKvBevERK2
         5w4NQqhu6aoReGHju46czE4rQ/sfHjt4WQx9eb39WfsEHx5ND9Br89ouxab0vgyVw89y
         qREE3qjW8iMyG3bHeJVRqxbjpBiXFwPGTsdfpeYsCDBOnFh+FZ/TCyTkB/XTd+JXlgup
         SkUQ==
X-Gm-Message-State: AC+VfDyaj0oQns+HKlKWW+PHv4UmDJN79Zhjft6kmM4207tCpvsQeQ1/
	6q137jZCzHLqeEBQwdJzB00d0kt/8kciYoOBWno=
X-Google-Smtp-Source: ACHHUZ4XSSjq9/3ccSAd+4dK8gj9M+sps2SRU6Al/tfzcEUz4yRg1TX76PohGxqk7bXWla/9EpCt0Q==
X-Received: by 2002:a7b:cc15:0:b0:3fa:77ed:9894 with SMTP id f21-20020a7bcc15000000b003fa77ed9894mr236281wmh.7.1688065149269;
        Thu, 29 Jun 2023 11:59:09 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a7bc399000000b003fa96fe2bebsm12106523wmj.41.2023.06.29.11.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 11:59:07 -0700 (PDT)
Date: Thu, 29 Jun 2023 21:59:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Eddie James <eajames@linux.ibm.com>,
	linux-hwmon@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com,
	lakshmiy@us.ibm.com
Subject: Re: [PATCH] hwmon: (pmbus/acbel-fsg032) Add firmware version debugfs
 attribute
Message-ID: <45a29025-4c06-4f88-b82f-a8002c25c376@kadam.mountain>
References: <20230627184027.16343-1-eajames@linux.ibm.com>
 <b12935a2-a8b7-4d70-8c7d-6fd1e92037c2@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b12935a2-a8b7-4d70-8c7d-6fd1e92037c2@kadam.mountain>

On Thu, Jun 29, 2023 at 09:53:16AM +0300, Dan Carpenter wrote:
> d2c6444389b625 Eddie James 2023-06-27  22  	char out[8];
> d2c6444389b625 Eddie James 2023-06-27  23  	int rc;
> d2c6444389b625 Eddie James 2023-06-27  24  	int i;
> d2c6444389b625 Eddie James 2023-06-27  25  
> d2c6444389b625 Eddie James 2023-06-27  26  	rc = pmbus_lock_interruptible(client);
> d2c6444389b625 Eddie James 2023-06-27  27  	if (rc)
> d2c6444389b625 Eddie James 2023-06-27  28  		return rc;
> d2c6444389b625 Eddie James 2023-06-27  29  
> d2c6444389b625 Eddie James 2023-06-27  30  	rc = i2c_smbus_read_block_data(client, ACBEL_MFR_FW_REVISION, data);
> d2c6444389b625 Eddie James 2023-06-27  31  	pmbus_unlock(client);
> d2c6444389b625 Eddie James 2023-06-27  32  	if (rc < 0)
> d2c6444389b625 Eddie James 2023-06-27  33  		return rc;
> d2c6444389b625 Eddie James 2023-06-27  34  
> d2c6444389b625 Eddie James 2023-06-27  35  	for (i = 0; i < rc && i < 3; ++i)
> d2c6444389b625 Eddie James 2023-06-27 @36  		snprintf(&out[i * 2], 3, "%02X", data[i]);
> 
> If data[i] is negative this will print FFFFFFF1 etc.  (This is an x86
> config...  Did we ever merge that patch to make char signed by default?)

I meant unsigned not signed.  But actually we debated both ways...
Signed by default would annoy PowerPC devs since they try to really
lean into the fact that char is unsigned on that arch.  :P

https://lwn.net/Articles/911914/

regards,
dan carpenter

