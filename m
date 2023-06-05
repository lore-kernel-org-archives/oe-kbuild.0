Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8486FAD3D
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jun 2023 07:32:27 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f7353993cbso10043275e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 05 Jun 2023 00:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685950344; x=1688542344;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWebPmkkXZwMfaAQP1En4s9/tKIJUkHKAcCHX0b4nT0=;
        b=yNe89sJMqjCvRZY8KEh8e9m6zed+dTP2I41xn3eYc6SuXCRiwwga/7uKmAV3YR+MsY
         iKPh9hPLUeJHndeZPKyYunIHQJxrFAs9VBmanypZwTHINNxFsA9dKnDfIrBEt742CRcv
         6rjBog+j2Uq6jBQzkVuhxPaOEvaKZdrtixGeKM3IQVXM1gS2YxJDj/Fz842+a6vakY39
         riKH/WUMV1ccD6Od5Vx9jtcUt2Hny8fW9U5ftKERRXESa+Clzd1BxbHZFxDyXpXO3xU5
         wPA9guClNV55pi6ueL/ghMtmxdcSqDSIZjpv5UL0sXHzqFFgn5t+BFAfk8vBF8UIL8g/
         k9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685950344; x=1688542344;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWebPmkkXZwMfaAQP1En4s9/tKIJUkHKAcCHX0b4nT0=;
        b=QgSy/uo8RFDxVzYtnoyL9GGMXBBLKtAckkZliJZbsw1JE2b9p4L8bX002CuMCpLaiR
         JZavfUFwbx6DMzyN16iemqwr0cyUAUl7D+B1h/KQbedPshwngkjbZYHq1izga7K2NmwD
         MNkGFCrwfW4HxVT2tA/RV9mSuAL/B6SAdCCPwqCWdBD23ElcBUb53AUpLPb3KCHllwSG
         048LbA4B+pLjdhbIx9BGQRFH8LLm5g/Wklnd3Oxg1eL9eulVjO7YPWvhAHWYzzsbGffX
         6ImvCzTMvBRrGQeNre5EnNILCxTJNfE9poySBV0sZM+AacGY/hRMpx0sqekdVhP44s/7
         hhYQ==
X-Gm-Message-State: AC+VfDwILpad7ji6386RDj5AAujrgj29iiFVulryTeBniG5hkpo5Jzfs
	jS9GLfsmt5m092pFqdWK5gKF6idRZBeLIMV2FCk=
X-Google-Smtp-Source: ACHHUZ6ETpTzw7MhCVETQT2q+Tvi7uvnSQJojKyiNat+/Nd4fj04M9SLAwejgKN8ZOdR8ZdTnTYXiw==
X-Received: by 2002:a1c:ed03:0:b0:3f4:1ce0:a606 with SMTP id l3-20020a1ced03000000b003f41ce0a606mr7175893wmh.1.1685950344248;
        Mon, 05 Jun 2023 00:32:24 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003f60482024fsm9877459wmc.30.2023.06.05.00.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 00:32:22 -0700 (PDT)
Date: Mon, 5 Jun 2023 10:32:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Johan Hovold <johan@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Corey Minyard <minyard@acm.org>
Subject: Re: [PATCH 1/3] USB: serial: return errors from break handling
Message-ID: <3ab35d0b-b5b6-4361-acac-59a4a9fbc970@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230602124642.19076-2-johan@kernel.org>

Hi Johan,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johan-Hovold/USB-serial-return-errors-from-break-handling/20230602-204856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git usb-next
patch link:    https://lore.kernel.org/r/20230602124642.19076-2-johan%40kernel.org
patch subject: [PATCH 1/3] USB: serial: return errors from break handling
config: i386-randconfig-m021-20230531 (https://download.01.org/0day-ci/archive/20230603/202306031014.qzAY3uQ6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306031014.qzAY3uQ6-lkp@intel.com/

New smatch warnings:
drivers/usb/serial/io_edgeport.c:1601 edge_break() error: uninitialized symbol 'status'.

vim +/status +1601 drivers/usb/serial/io_edgeport.c

12992379710489 Johan Hovold       2023-06-02  1563  static int edge_break(struct tty_struct *tty, int break_state)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1564  {
95da310e66ee80 Alan Cox           2008-07-22  1565  	struct usb_serial_port *port = tty->driver_data;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1566  	struct edgeport_port *edge_port = usb_get_serial_port_data(port);
6e8cf7751f9fb9 Greg Kroah-Hartman 2007-01-18  1567  	struct edgeport_serial *edge_serial = usb_get_serial_data(port->serial);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1568  	int status;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1569  
232dce89b5b000 Geyslan G. Bem     2015-12-11  1570  	if (!edge_serial->is_epic ||
232dce89b5b000 Geyslan G. Bem     2015-12-11  1571  	    edge_serial->epic_descriptor.Supports.IOSPChase) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1572  		/* flush and chase */
cb8eaa8b2b9133 Richard Knutsson   2007-03-17  1573  		edge_port->chaseResponsePending = true;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1574  
984f68683298ba Greg Kroah-Hartman 2012-09-18  1575  		dev_dbg(&port->dev, "%s - Sending IOSP_CMD_CHASE_PORT\n", __func__);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1576  		status = send_iosp_ext_cmd(edge_port, IOSP_CMD_CHASE_PORT, 0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1577  		if (status == 0) {
03f0dbf74c7a11 Alan Cox           2008-07-22  1578  			/* block until chase finished */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1579  			block_until_chase_response(edge_port);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1580  		} else {
cb8eaa8b2b9133 Richard Knutsson   2007-03-17  1581  			edge_port->chaseResponsePending = false;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1582  		}
6e8cf7751f9fb9 Greg Kroah-Hartman 2007-01-18  1583  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1584  
232dce89b5b000 Geyslan G. Bem     2015-12-11  1585  	if (!edge_serial->is_epic ||
232dce89b5b000 Geyslan G. Bem     2015-12-11  1586  	    edge_serial->epic_descriptor.Supports.IOSPSetClrBreak) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1587  		if (break_state == -1) {
984f68683298ba Greg Kroah-Hartman 2012-09-18  1588  			dev_dbg(&port->dev, "%s - Sending IOSP_CMD_SET_BREAK\n", __func__);
03f0dbf74c7a11 Alan Cox           2008-07-22  1589  			status = send_iosp_ext_cmd(edge_port,
03f0dbf74c7a11 Alan Cox           2008-07-22  1590  						IOSP_CMD_SET_BREAK, 0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1591  		} else {
984f68683298ba Greg Kroah-Hartman 2012-09-18  1592  			dev_dbg(&port->dev, "%s - Sending IOSP_CMD_CLEAR_BREAK\n", __func__);
03f0dbf74c7a11 Alan Cox           2008-07-22  1593  			status = send_iosp_ext_cmd(edge_port,
03f0dbf74c7a11 Alan Cox           2008-07-22  1594  						IOSP_CMD_CLEAR_BREAK, 0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1595  		}

"status" uninitialized on else path.

03f0dbf74c7a11 Alan Cox           2008-07-22  1596  		if (status)
984f68683298ba Greg Kroah-Hartman 2012-09-18  1597  			dev_dbg(&port->dev, "%s - error sending break set/clear command.\n",
03f0dbf74c7a11 Alan Cox           2008-07-22  1598  				__func__);
6e8cf7751f9fb9 Greg Kroah-Hartman 2007-01-18  1599  	}
12992379710489 Johan Hovold       2023-06-02  1600  
12992379710489 Johan Hovold       2023-06-02 @1601  	return status;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1602  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

