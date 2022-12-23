Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B523517CD;
	Fri, 23 Dec 2022 11:03:40 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id l10so855175wrv.7;
        Fri, 23 Dec 2022 03:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KvYvXobQ+Ky3hqmyTPit8ouaMYhq1ZZFDys9+K2SpT8=;
        b=m5i+tXbswj3gQWymnBrVrFXUbgdHhHSzjX2wl3SZKz1JMnKthqpyZ7h1NdVwmJy0IZ
         fyU6zfXrGruDte6Q4y8ESLR6q9CbV7OnrENIfOM5m0sYuHufVNXutX0oT+Nui8I+J0+O
         3fid+z7FxSfYqiU6DB/e/qXskENP2MfuC5EyCYdbYC+xWqKFU8n/k0ljCJVw3Mu1l3+r
         bNXHc8WtI4D3/UFPJns24TA73EhccdZOE98EyiXZ7Jeo4S3bw8CMntY+G/ORucMZ8vis
         ayr1QOvINIk2qseILiXGPNMZ6dP8lUvM6JM1SOzutS57teSmT6HAfxpcG0thVL6HrcYf
         k10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KvYvXobQ+Ky3hqmyTPit8ouaMYhq1ZZFDys9+K2SpT8=;
        b=KwX/wOd3LPJIg1oOy6yQG4oqvjwy4SKmHONfhmIlixJooW218B0sHWvxp5tEW2GtDu
         YO6KxbW8eQIgGilyaD5suGwdYKA+gGteGtO1r7WHuzCArRd/on/BJq/NEs18CNF7f9yy
         t3kPOOwEIYd7VfUK5HIxIVFWHHMvx63ZbbSmHq39roZoWjwG8z7IlZilZEQL+QTlqz0Y
         yYmd106MeFxR5/mNtukTXmFH/N6isWBP2FkaGqNdQw8j4tL80jHOAFHEeNWKgDk5Ua1a
         T3Vk3sjwwaIY0JBOXApy3kbANza2WzROmmQXhS0V2eIlnona4bs/WBEi8u3XLGFvv/+J
         yOiQ==
X-Gm-Message-State: AFqh2kp8xKrh0KcdABpI2gxk4JjRCutPcqsOcO8Z2M1AXA6oa0+EQoSq
	OD+wxF/7ihuLe5aLBKczR+NHZo+xTgu0qQ==
X-Google-Smtp-Source: AMrXdXslk5QScMgjYn9aeyWXDO0SBZSzPBTXvCA9H9+GU993tZtuAjoWFjDuKR3HHsBEm5KDvuEikg==
X-Received: by 2002:adf:ef8f:0:b0:242:7491:3be0 with SMTP id d15-20020adfef8f000000b0024274913be0mr7605133wro.67.1671793418749;
        Fri, 23 Dec 2022 03:03:38 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d490f000000b00236883f2f5csm2816167wrq.94.2022.12.23.03.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 03:03:38 -0800 (PST)
Date: Fri, 23 Dec 2022 14:03:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Sagi Grimberg <sagi@grimberg.me>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: drivers/nvme/host/auth.c:950 nvme_auth_init_ctrl() warn: missing
 error code? 'ret'
Message-ID: <202212222333.vrYfUBqM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221223110334.Lxaguol-RbiRZjqbpglDn2D_3bACNDAzNBCLm-4aLwY@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d2f6060fe4c3b49d0cdc1dce1c99296f33379c8
commit: aa36d711e945e65fa87410927800f01878a8faed nvme-auth: convert dhchap_auth_list to an array
config: i386-randconfig-m021-20221219
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/nvme/host/auth.c:950 nvme_auth_init_ctrl() warn: missing error code? 'ret'

vim +/ret +950 drivers/nvme/host/auth.c

193a8c7e5f1a84 Sagi Grimberg   2022-11-13  931  int nvme_auth_init_ctrl(struct nvme_ctrl *ctrl)
f50fff73d620cd Hannes Reinecke 2022-06-27  932  {
aa36d711e945e6 Sagi Grimberg   2022-11-13  933  	struct nvme_dhchap_queue_context *chap;
aa36d711e945e6 Sagi Grimberg   2022-11-13  934  	int i, ret;
193a8c7e5f1a84 Sagi Grimberg   2022-11-13  935  
f50fff73d620cd Hannes Reinecke 2022-06-27  936  	mutex_init(&ctrl->dhchap_auth_mutex);
aa36d711e945e6 Sagi Grimberg   2022-11-13  937  	INIT_WORK(&ctrl->dhchap_auth_work, nvme_ctrl_auth_work);
f50fff73d620cd Hannes Reinecke 2022-06-27  938  	if (!ctrl->opts)
193a8c7e5f1a84 Sagi Grimberg   2022-11-13  939  		return 0;
193a8c7e5f1a84 Sagi Grimberg   2022-11-13  940  	ret = nvme_auth_generate_key(ctrl->opts->dhchap_secret,
193a8c7e5f1a84 Sagi Grimberg   2022-11-13  941  			&ctrl->host_key);
193a8c7e5f1a84 Sagi Grimberg   2022-11-13  942  	if (ret)
193a8c7e5f1a84 Sagi Grimberg   2022-11-13  943  		return ret;
193a8c7e5f1a84 Sagi Grimberg   2022-11-13  944  	ret = nvme_auth_generate_key(ctrl->opts->dhchap_ctrl_secret,
193a8c7e5f1a84 Sagi Grimberg   2022-11-13  945  			&ctrl->ctrl_key);
aa36d711e945e6 Sagi Grimberg   2022-11-13  946  	if (ret)
aa36d711e945e6 Sagi Grimberg   2022-11-13  947  		goto err_free_dhchap_secret;
aa36d711e945e6 Sagi Grimberg   2022-11-13  948  
aa36d711e945e6 Sagi Grimberg   2022-11-13  949  	if (!ctrl->opts->dhchap_secret && !ctrl->opts->dhchap_ctrl_secret)
aa36d711e945e6 Sagi Grimberg   2022-11-13 @950  		return ret;

Please return a literal here.  Either return -EINVAL or return 0;

aa36d711e945e6 Sagi Grimberg   2022-11-13  951  
aa36d711e945e6 Sagi Grimberg   2022-11-13  952  	ctrl->dhchap_ctxs = kvcalloc(ctrl_max_dhchaps(ctrl),
aa36d711e945e6 Sagi Grimberg   2022-11-13  953  				sizeof(*chap), GFP_KERNEL);
aa36d711e945e6 Sagi Grimberg   2022-11-13  954  	if (!ctrl->dhchap_ctxs) {
aa36d711e945e6 Sagi Grimberg   2022-11-13  955  		ret = -ENOMEM;
aa36d711e945e6 Sagi Grimberg   2022-11-13  956  		goto err_free_dhchap_ctrl_secret;
aa36d711e945e6 Sagi Grimberg   2022-11-13  957  	}
aa36d711e945e6 Sagi Grimberg   2022-11-13  958  
aa36d711e945e6 Sagi Grimberg   2022-11-13  959  	for (i = 0; i < ctrl_max_dhchaps(ctrl); i++) {
aa36d711e945e6 Sagi Grimberg   2022-11-13  960  		chap = &ctrl->dhchap_ctxs[i];
aa36d711e945e6 Sagi Grimberg   2022-11-13  961  		chap->qid = i;
aa36d711e945e6 Sagi Grimberg   2022-11-13  962  		chap->ctrl = ctrl;
aa36d711e945e6 Sagi Grimberg   2022-11-13  963  		INIT_WORK(&chap->auth_work, nvme_queue_auth_work);
aa36d711e945e6 Sagi Grimberg   2022-11-13  964  	}
aa36d711e945e6 Sagi Grimberg   2022-11-13  965  
aa36d711e945e6 Sagi Grimberg   2022-11-13  966  	return 0;
aa36d711e945e6 Sagi Grimberg   2022-11-13  967  err_free_dhchap_ctrl_secret:
aa36d711e945e6 Sagi Grimberg   2022-11-13  968  	nvme_auth_free_key(ctrl->ctrl_key);
aa36d711e945e6 Sagi Grimberg   2022-11-13  969  	ctrl->ctrl_key = NULL;
aa36d711e945e6 Sagi Grimberg   2022-11-13  970  err_free_dhchap_secret:
193a8c7e5f1a84 Sagi Grimberg   2022-11-13  971  	nvme_auth_free_key(ctrl->host_key);
193a8c7e5f1a84 Sagi Grimberg   2022-11-13  972  	ctrl->host_key = NULL;
193a8c7e5f1a84 Sagi Grimberg   2022-11-13  973  	return ret;
f50fff73d620cd Hannes Reinecke 2022-06-27  974  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

