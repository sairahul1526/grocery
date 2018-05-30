import 'dart:async';

var name = "Sai Rahul";
var address = "Flat No. 222\nHeritage Apartments, Plot No. 10,\nDwaraka, New Delhi 110075\nIndia";

var addresses = [
  [
    "Sai Rahul",
    "Flat No. 222",
    "Heritage Apartments, Plot No. 10",
    "Dwaraka",
  ],
  [
    "Sai Rahul",
    "Flat No. 101",
    "Rahul Apartments, Plot No. 10",
    "Shah Bazar",
  ],
];

var categoriesList = [
  [
    "Fruits & Vegetables",
    {
      "All Fruits & Vegetables": [1,2,3,4,5,6,7,8],
      "Fresh Vegetables": [1,2,3],
      "Herbs & Seasoning": [7,8],
      "Fresh Fruits": [1,4,7,8],
      "Exotic Fruits & Veggies": [8,7,3,1,2]
    }
  ],
  [
    "Foodgrains, Oil & Masala",
    {
      "All Foodgrains, Oil & Masala": [8,7,3,1,2],
      "Atta, Flours & Sooji": [1,2,3,4,5,6,7,8],
      "Salt, Sugar & Jaggery": [8,7,6,5,4,3,2,1]
    }
  ]
];

var about = [
  [
    "",
    [
      [
        "What is GROCERY",
        "GROCERY (Innovative Retail Concepts Private Limited) is India’s largest online food and grocery store. With over 18,000 products and over a 1000 brands in our catalogue you will find everything you are looking for. Right from fresh Fruits and Vegetables, Rice and Dals, Spices and Seasonings to Packaged products, Beverages, Personal care products, Meats – we have it all. Choose from a wide range of options in every category, exclusively handpicked to help you find the best quality available at the lowest prices. Select a time slot for delivery and your order will be delivered right to your doorstep, anywhere in Bangalore, Hyderabad, Mumbai, Pune, Chennai, Delhi, Noida, Mysore, Coimbatore, Vijayawada-Guntur, Kolkata, Ahmedabad-Gandhinagar, Lucknow-Kanpur, Gurgaon, Vadodara, Visakhapatnam, Surat, Nagpur, Patna, Indore and Chandigarh Tricity You can pay online using your debit / credit card or by cash / sodexo on delivery. We guarantee on time delivery, and the best quality!"
      ],
      [
        "Why should I use GROCERY?",
        "GROCERY allows you to walk away from the drudgery of grocery shopping and welcome an easy relaxed way of browsing and shopping for groceries. Discover new products and shop for all your food and grocery needs from the comfort of your home or office. No more getting stuck in traffic jams, paying for parking, standing in long queues and carrying heavy bags – get everything you need, when you need, right at your doorstep. Food shopping online is now easy as every product on your monthly shopping list, is now available online at GROCERY, India’s best online grocery store."
      ],
      [
        "Where do we operate",
        "We currently offer our services in Bangalore, Hyderabad, Mumbai, Pune, Chennai, Delhi, Noida, Mysore, Coimbatore, Vijayawada-Guntur, Kolkata, Ahmedabad-Gandhinagar, Lucknow-Kanpur, Gurgaon, Vadodara, Visakhapatnam, Surat, Nagpur, Patna, Indore and Chandigarh Tricity city limits."
      ]
    ]
  ],
  [
    "Privacy Policy",
    [
      [
        "Personal Information",
        "Innovative Retail Concepts Pvt Ltd (“IRCPL”) is the licensed owner of the brand GROCERY and the website GROCERY (”The Site”) from Supermarket Grocery Supplies Pvt Ltd (“SGSPL”). IRCPL respects your privacy. This Privacy Policy provides succinctly the manner your data is collected and used by IRCPL on the Site. As a visitor to the Site/ Customer you are advised to please read the Privacy Policy carefully. By accessing the services provided by the Site you agree to the collection and use of your data by IRCPL in the manner provided in this Privacy Policy."
      ],
      [
        "What information is, or may be, collected form you?",
        "As part of the registration process on the Site, IRCPL may collect the following personally identifiable information about you: Name including first and last name, alternate email address, mobile phone number and contact details, Postal code, Demographic profile (like your age, gender, occupation, education, address etc.) and information about the pages on the site you visit/access, the links you click on the site, the number of times you access the page and any such browsing information."
      ],
      [
        "How do we Collect the Information ?",
        "IRCPL will collect personally identifiable information about you only as part of a voluntary registration process, on-line survey or any combination thereof. The Site may contain links to other Web sites. IRCPL is not responsible for the privacy practices of such Web sites which it does not own, manage or control. The Site and third-party vendors, including Google, use first-party cookies (such as the Google Analytics cookie) and third-party cookies (such as the DoubleClick cookie) together to inform, optimize, and serve ads based on someone's past visits to the Site."
      ],
      [
        "How is information used ?",
        "IRCPL will use your personal information to provide personalized features to you on the Site and to provide for promotional offers to you through the Site and other channels. IRCPL will also provide this information to its business associates and partners to get in touch with you when necessary to provide the services requested by you. IRCPL will use this information to preserve transaction history as governed by existing law or policy. IRCPL may also use contact information internally to direct its efforts for product improvement, to contact you as a survey respondent, to notify you if you win any contest; and to send you promotional materials from its contest sponsors or advertisers. IRCPL will also use this information to serve various promotional and advertising materials to you via display advertisements through the Google Ad network on third party websites. You can opt out of Google Analytics for Display Advertising and customize Google Display network ads using the Ads Preferences Manager. Information about Customers on an aggregate (exlcuding any information that may identify you specifically) covering Customer transaction data and Customer demographic and location data may be provided to partners of IRCPL for the purpose of creating additional features on the website, creating appropriate merchandising or creating new products and services and conducting marketing research and statistical analysis of customer behaviour and transactions."
      ],
      [
        "With whom your information will be shared",
        "IRCPL will not use your financial information for any purpose other than to complete a transaction with you. IRCPL does not rent, sell or share your personal information and will not disclose any of your personally identifiable information to third parties. In cases where it has your permission to provide products or services you've requested and such information is necessary to provide these products or services the information may be shared with IRCPL’s business associates and partners. IRCPL may, however, share consumer information on an aggregate with its partners or thrird parties where it deems necessary. In addition IRCPL may use this information for promotional offers, to help investigate, prevent or take action regarding unlawful and illegal activities, suspected fraud, potential threat to the safety or security of any person, violations of the Site’s terms of use or to defend against legal claims; special circumstances such as compliance with subpoenas, court orders, requests/order from legal authorities or law enforcement agencies requiring such disclosure."
      ],
      [
        "What Choice are available to you regarding collection, use and distribution of your information ?",
        "To protect against the loss, misuse and alteration of the information under its control, IRCPL has in place appropriate physical, electronic and managerial procedures. For example, IRCPL servers are accessible only to authorized personnel and your information is shared with employees and authorised personnel on a need to know basis to complete the transaction and to provide the services requested by you. Although IRCPL will endeavour to safeguard the confidentiality of your personally identifiable information, transmissions made by means of the Internet cannot be made absolutely secure. By using this site, you agree that IRCPL will have no liability for disclosure of your information due to errors in transmission or unauthorized acts of third parties."
      ],
      [
        "How can you correct inaccuracies in the information ?",
        "To correct or update any information you have provided, the Site allows you to do it online. In the event of loss of access details you can send an e-mail to: customerservice@grocery.com"
      ],
      [
        "Policy updates",
        "IRCPL reserves the right to change or update this policy at any time. Such changes shall be effective immediately upon posting to the Site."
      ],
      [
        "Contact Information",
        "Innovative Retail Concepts Pvt Ltd,\n1st Floor, Service Road, Domlur 2nd Stage,\nOff Indiranagar 100ft Road, Bangalore-560071 INDIA\nTel.: +91 80 3355 1000\nEmail id: customerservice@grocery.com"
      ]
    ]
  ],
  [
    "Terms and Conditions",
    [
      [
        "Personal Information",
        "Innovative Retail Concepts Pvt Ltd (“IRCPL”) is the licensed owner of the brand GROCERY and the website GROCERY (”The Site”) from Supermarket Grocery Supplies Pvt Ltd (“SGSPL”). IRCPL respects your privacy. This Privacy Policy provides succinctly the manner your data is collected and used by IRCPL on the Site. As a visitor to the Site/ Customer you are advised to please read the Privacy Policy carefully. By accessing the services provided by the Site you agree to the collection and use of your data by IRCPL in the manner provided in this Privacy Policy."
      ],
      [
        "Services overview",
        "As part of the registration process on the Site, IRCPL may collect the following personally identifiable information about you: Name including first and last name, alternate email address, mobile phone number and contact details, Postal code, Demographic profile (like your age, gender, occupation, education, address etc.) and information about the pages on the site you visit/access, the links you click on the site, the number of times you access the page and any such browsing information."
      ],
      [
        "Eligibility",
        "Services of the Site would be available to only select geographies in India. Persons who are \"incompetent to contract\" within the meaning of the Indian Contract Act, 1872 including un-discharged insolvents etc. are not eligible to use the Site. If you are a minor i.e. under the age of 18 years but at least 13 years of age you may use the Site only under the supervision of a parent or legal guardian who agrees to be bound by these Terms of Use. If your age is below 18 years your parents or legal guardians can transact on behalf of you if they are registered users. You are prohibited from purchasing any material which is for adult consumption and the sale of which to minors is prohibited"
      ],
      [
        "License & Site access",
        "IRCPL grants you a limited sub-license to access and make personal use of this site and not to download (other than page caching) or modify it, or any portion of it, except with express written consent of IRCPL. This license does not include any resale or commercial use of this site or its contents; any collection and use of any product listings, descriptions, or prices; any derivative use of this site or its contents; any downloading or copying of account information for the benefit of another merchant; or any use of data mining, robots, or similar data gathering and extraction tools. This site or any portion of this site may not be reproduced, duplicated, copied, sold, resold, visited, or otherwise exploited for any commercial purpose without express written consent of IRCPL. You may not frame or utilize framing techniques to enclose any trademark, logo, or other proprietary information (including images, text, page layout, or form) of the Site or of IRCPL and its affiliates without express written consent. You may not use any meta tags or any other \"hidden text\" utilizing the Site’s or IRCPL’s name or SGSPL’s name or trademarks without the express written consent of IRCPL. Any unauthorized use terminates the permission or license granted by IRCPL"
      ],
      [
        "Account & Registration Obligations",
        "All shoppers have to register and login for placing orders on the Site. You have to keep your account and registration details current and correct for communications related to your purchases from the site. By agreeing to the terms and conditions, the shopper agrees to receive promotional communication and newsletters upon registration. The customer can opt out either by unsubscribing in \"My Account\" or by contacting the customer service. "
      ],
      [
        "Pricing",
        "All the products listed on the Site will be sold at MRP unless otherwise specified. The prices mentioned at the time of ordering will be the prices charged on the date of the delivery. Although prices of most of the products do not fluctuate on a daily basis but some of the commodities and fresh food prices do change on a daily basis. In case the prices are higher or lower on the date of delivery not additional charges will be collected or refunded as the case may be at the time of the delivery of the order."
      ],
      [
        "Cancellation by Site / Customer",
        "You as a customer can cancel your order anytime up to the cut-off time of the slot for which you have placed an order by calling our customer service. In such a case we will refund any payments already made by you for the order. If we suspect any fraudulent transaction by any customer or any transaction which defies the terms & conditions of using the website, we at our sole discretion could cancel such orders. We will maintain a negative list of all fraudulent transactions and customers and would deny access to them or cancel any orders placed by them."
      ],
      [
        "Return & Refunds",
        "We have a \"no questions asked return and refund policy\" which entitles all our members to return the product at the time of delivery if due to some reason they are not satisfied with the quality or freshness of the product. We will take the returned product back with us and issue a credit note for the value of the return products which will be credited to your account on the Site. This can be used to pay your subsequent shopping bills."
      ],
      [
        "You Agree and Confirm",
        "That in the event that a non-delivery occurs on account of a mistake by you (i.e. wrong name or address or any other wrong information) any extra cost incurred by IRCPL for redelivery shall be claimed from you. That you will use the services provided by the Site, its affiliates, consultants and contracted companies, for lawful purposes only and comply with all applicable laws and regulations while using and transacting on the Site. You will provide authentic and true information in all instances where such information is requested of you. IRCPL reserves the right to confirm and validate the information and other details provided by you at any point of time. If upon confirmation your details are found not to be true (wholly or partly), it has the right in its sole discretion to reject the registration and debar you from using the Services and / or other affiliated websites without prior intimation whatsoever. That you are accessing the services available on this Site and transacting at your sole risk and are using your best and prudent judgment before entering into any transaction through this Site. That the address at which delivery of the product ordered by you is to be made will be correct and proper in all respects. That before placing an order you will check the product description carefully. By placing an order for a product you agree to be bound by the conditions of sale included in the item's description."
      ],
      [
        "You may not use the Site for any of the following purposes:",
        "Disseminating any unlawful, harassing, libellous, abusive, threatening, harmful, vulgar, obscene, or otherwise objectionable material. Transmitting material that encourages conduct that constitutes a criminal offence or results in civil liability or otherwise breaches any relevant laws, regulations or code of practice. Gaining unauthorized access to other computer systems. Interfering with any other person's use or enjoyment of the Site. Breaching any applicable laws; Interfering or disrupting networks or web sites connected to the Site. Making, transmitting or storing electronic copies of materials protected by copyright without the permission of the owner."
      ],
      [
        "Colours",
        "We have made every effort to display the colours of our products that appear on the Website as accurately as possible. However, as the actual colours you see will depend on your monitor, we cannot guarantee that your monitor's display of any colour will be accurate."
      ],
      [
        "Modification of Terms & Conditions of Service",
        "IRCPL may at any time modify the Terms & Conditions of Use of the Website without any prior notification to you. You can access the latest version of these Terms & Conditions at any given time on the Site. You should regularly review the Terms & Conditions on the Site. In the event the modified Terms & Conditions is not acceptable to you, you should discontinue using the Service. However, if you continue to use the Service you shall be deemed to have agreed to accept and abide by the modified Terms & Conditions of Use of this Site."
      ],
      [
        "Governing Law and Jurisdiction",
        "This User Agreement shall be construed in accordance with the applicable laws of India. The Courts at Bangalore shall have exclusive jurisdiction in any proceedings arising out of this agreement. Any dispute or difference either in interpretation or otherwise, of any terms of this User Agreement between the parties hereto, the same shall be referred to an independent arbitrator who will be appointed by IRCPL and his decision shall be final and binding on the parties hereto. The above arbitration shall be in accordance with the Arbitration and Conciliation Act, 1996 as amended from time to time. The arbitration shall be held in Bangalore. The High Court of judicature at Bangalore alone shall have the jurisdiction and the Laws of India shall apply."
      ],
      [
        "Reviews, Feedback, Submissions",
        "All reviews, comments, feedback, postcards, suggestions, ideas, and other submissions disclosed, submitted or offered to the Site on or by this Site or otherwise disclosed, submitted or offered in connection with your use of this Site (collectively, the \"Comments\") shall be and remain the property of IRCPL. Such disclosure, submission or offer of any Comments shall constitute an assignment to IRCPL of all worldwide rights, titles and interests in all copyrights and other intellectual properties in the Comments. Thus, IRCPL owns exclusively all such rights, titles and interests and shall not be limited in any way in its use, commercial or otherwise, of any Comments. IRCPL will be entitled to use, reproduce, disclose, modify, adapt, create derivative works from, publish, display and distribute any Comments you submit for any purpose whatsoever, without restriction and without compensating you in any way. IRCPL is and shall be under no obligation (1) to maintain any Comments in confidence; (2) to pay you any compensation for any Comments; or (3) to respond to any Comments. You agree that any Comments submitted by you to the Site will not violate this policy or any right of any third party, including copyright, trademark, privacy or other personal or proprietary right(s), and will not cause injury to any person or entity. You further agree that no Comments submitted by you to the Website will be or contain libellous or otherwise unlawful, threatening, abusive or obscene material, or contain software viruses, political campaigning, commercial solicitation, chain letters, mass mailings or any form of \"spam\". IRCPL does not regularly review posted Comments, but does reserve the right (but not the obligation) to monitor and edit or remove any Comments submitted to the Site. You grant IRCPL the right to use the name that you submit in connection with any Comments. You agree not to use a false email address, impersonate any person or entity, or otherwise mislead as to the origin of any Comments you submit. You are and shall remain solely responsible for the content of any Comments you make and you agree to indemnify IRCPL and its affiliates for all claims resulting from any Comments you submit. IRCPL and its affiliates take no responsibility and assume no liability for any Comments submitted by you or any third party."
      ],
      [
        "Copyright & Trademark",
        "IRCPL and SGSPL, its suppliers and licensors expressly reserve all intellectual property rights in all text, programs, products, processes, technology, content and other materials, which appear on this Site. Access to this Website does not confer and shall not be considered as conferring upon anyone any license under any of IRCPL or any third party's intellectual property rights. All rights, including copyright, in this website are owned by or licensed to IRCPL from SGSPL. Any use of this website or its contents, including copying or storing it or them in whole or part, other than for your own personal, non-commercial use is prohibited without the permission of IRCPL and/or SGSPL. You may not modify, distribute or re-post anything on this website for any purpose. The names and logos and all related product and service names, design marks and slogans are the trademarks or service marks of SGSPL, IRCPL, its affiliates, its partners or its suppliers. All other marks are the property of their respective companies. No trademark or service mark license is granted in connection with the materials contained on this Site. Access to this Site does not authorize anyone to use any name, logo or mark in any manner. References on this Site to any names, marks, products or services of third parties or hypertext links to third party sites or information are provided solely as a convenience to you and do not in any way constitute or imply IRCPL or SGSPL endorsement, sponsorship or recommendation of the third party, information, product or service. IRCPL or SGSPL is not responsible for the content of any third party sites and does not make any representations regarding the content or accuracy of material on such sites. If you decide to link to any such third party websites, you do so entirely at your own risk. All materials, including images, text, illustrations, designs, icons, photographs, programs, music clips or downloads, video clips and written and other materials that are part of this Website (collectively, the \"Contents\") are intended solely for personal, non-commercial use. You may download or copy the Contents and other downloadable materials displayed on the Website for your personal use only. No right, title or interest in any downloaded materials or software is transferred to you as a result of any such downloading or copying. You may not reproduce (except as noted above), publish, transmit, distribute, display, modify, create derivative works from, sell or participate in any sale of or exploit in any way, in whole or in part, any of the Contents, the Website or any related software. All software used on this Website is the property of SGSPL or its licensees and suppliers and protected by Indian and international copyright laws. The Contents and software on this Website may be used only as a shopping resource. Any other use, including the reproduction, modification, distribution, transmission, republication, display, or performance, of the Contents on this Website is strictly prohibited. Unless otherwise noted, all Contents are copyrights, trademarks, trade dress and/or other intellectual property owned, controlled or licensed by IRCPL, one of its affiliates or by third parties who have licensed their materials to IRCPL and are protected by Indian and international copyright laws. The compilation (meaning the collection, arrangement, and assembly) of all Contents on this Website is the exclusive property of SGSPL and IRCPL and is also protected by Indian and international copyright laws."
      ],
      [
        "Objectionable Material",
        "You understand that by using this Site or any services provided on the Site, you may encounter Content that may be deemed by some to be offensive, indecent, or objectionable, which Content may or may not be identified as such. You agree to use the Site and any service at your sole risk and that to the fullest extent permitted under applicable law, SGSPL and/or IRCPL and its affiliates shall have no liability to you for Content that may be deemed offensive, indecent, or objectionable to you."
      ],
      [
        "Indemnity",
        "You agree to defend, indemnify and hold harmless SGSPL, IRCPL, its employees, directors, officers, agents and their successors and assigns from and against any and all claims, liabilities, damages, losses, costs and expenses, including attorney's fees, caused by or arising out of claims based upon your actions or inactions, which may result in any loss or liability to SGSPL or IRCPL or any third party including but not limited to breach of any warranties, representations or undertakings or in relation to the non-fulfilment of any of your obligations under this User Agreement or arising out of the your violation of any applicable laws, regulations including but not limited to Intellectual Property Rights, payment of statutory dues and taxes, claim of libel, defamation, violation of rights of privacy or publicity, loss of service by other subscribers and infringement of intellectual property or other rights. This clause shall survive the expiry or termination of this User Agreement."
      ],
      [
        "Termination",
        "This User Agreement is effective unless and until terminated by either you or IRCPL. You may terminate this User Agreement at any time, provided that you discontinue any further use of this Site. IRCPL may terminate this User Agreement at any time and may do so immediately without notice, and accordingly deny you access to the Site, Such termination will be without any liability to IRCPL. Upon any termination of the User Agreement by either you or IRCPL, you must promptly destroy all materials downloaded or otherwise obtained from this Site, as well as all copies of such materials, whether made under the User Agreement or otherwise. IRCPL's right to any Comments shall survive any termination of this User Agreement. Any such termination of the User Agreement shall not cancel your obligation to pay for the product already ordered from the Website or affect any liability that may have arisen under the User Agreement."
      ]
    ]
  ]
];

var offers = [
  "https://assetscdn1.paytm.com/images/catalog/product/D/DE/DEAUP-TO-RS-100PAYT4B592D3C4/0x1920/70/2.jpg?imwidth=282&impolicy=hq",
  "https://assetscdn1.paytm.com/images/catalog/product/D/DE/DEAUP-TO-RS-250PAYT41BC19281/0x1920/70/5.jpg?imwidth=282&impolicy=hq",
  "https://assetscdn1.paytm.com/images/catalog/product/D/DE/DEAUPTO-RS-100-PAYT4285580A3/0x1920/70/2.jpg?imwidth=282&impolicy=hq",
  "https://assetscdn1.paytm.com/images/catalog/product/D/DE/DEAUP-TO-RS-500PAYT479665B73/0x1920/70/1.jpg?imwidth=282&impolicy=hq"
];

var faqs = [
  [
    "General queries",
    [
      [
        "What is GROCERY?",
        "GROCERY is India’s largest and most convenient hyper local delivery company which enables you to order grocery, bakery, fruits & vegetables and other products that you need every day, directly via your mobile or web browser."
      ],
      [
        "What kind of products do you sell?",
        "You can choose from over 120,000 products spread across various categories such as grocery, bakery, fruits & vegetables, beverages, personal care products, baby care products, pet products and much more."
      ],
      [
        "What cities and locations do you operate in?",
        "GROCERY currently operates in Agra, Ahmedabad, Bengaluru, Bhubaneswar, Chennai, Cuttack, Chandigarh, Hyderabad, Indore, Jaipur, Kanpur, Kochi, Kolkata, Lucknow, Ludhiana, Madurai, Mumbai, NCR, Nagpur, Pune, Ranchi, Surat and Vadodara."
      ],
      [
        "Do you deliver to my location?",
        "We deliver in select localities across the cities we are present in. You can edit your location settings to check if we deliver in your area."
      ],
      [
        "What is the minimum order value?",
        "There is no minimum order value. However, each store has a minimum order value to qualify for free delivery. In case you do not reach the limit, a delivery charge will be levied against that order."
      ],
      [
        "Do you charge any amount or taxes over and above the rates shown?",
        "No, we do not charge anything over and above the rates shown. However, we do have a delivery fee in case the order value per store does not reach the minimum order value for free delivery."
      ],
      [
        "Can I track the status of my order?",
        "Yes, you can track the status of your order under the My Orders section."
      ],
      [
        "How can I make changes to my order before and after confirmation?",
        "You can edit your products in the cart before checkout. If you’ve already placed your order, you can cancel and reorder with the required list from the app and this will be soon released on web as well."
      ]
    ]
  ],
  [
    "Payments/Refund related queries",
    [
      [
        "How can I make payments at GROCERY?",
        "GROCERY accepts multiple modes of payment. You can make online payments using credit cards, debit cards, netbanking, PayTM, PayU Money and Mobikwik Wallet. Cash on delivery (COD) is also available for orders less than Rs. 5000."
      ],
      [
        "When will I get my cashback?",
        "If your transaction is eligible for a cashback, you will receive it within 6 to 12 hours of delivery, in your GROCERY Wallet. In case of external wallet promotions, you will receive it within 72 hours of placing your order."
      ],
      [
        "How long do you take to initiate my refund?",
        "For amounts lower than Rs. 500, the refund will reflect as GROCERY Cash within 24 hours, once the order is delivered. For amounts higher than Rs. 500, the refund will be credited back to your original mode of payment, i.e. within 7-10 working days for debit/credit card payments and 24-48 hours for other wallets."
      ],
      [
        "What is GROCERY Cash?",
        "GROCERY cash is a cashless method of transacting on the GROCERY Platform. Your GROCERY Wallet is automatically activated upon registration. Any refund, for amount less than Rs. 500, will be credited in the form of GROCERY Cash which will be visible on the GROCERY mobile app. This can be used at any point of time for future transactions on GROCERY app and web. If you would like to transfer your GROCERY Cash, do let us know via the help section and we will be happy to help you."
      ],
      [
        "Can I top up my GROCERY Cash?",
        "Currently we use GROCERY Cash for refunds only. However, very soon you should be able to add money as GROCERY Cash as well."
      ],
      [
        "What is the validity of GROCERY Cash?",
        "Cashback will expire after a minimum duration of 60 days from last order unless specified or added through a separate campaign, which can be subject to a shorter expiry time."
      ],
      [
        "How can I review my receipt?",
        "We handover the receipt from the merchant to you at the time of delivery. Also, you can look at your transaction history in the “My Orders” tab."
      ]
    ]
  ],
  [
    "Cancellation & Returns",
    [
      [
        "How can I cancel my order?",
        "GROCERY provides easy and hassle-free cancellation. You can cancel your order via the app or web before it is dispatched to your home. This option is available under the “My Orders” tab in “View Details”. Please note: Once the order is packed, the merchant may levy a fee of Rs.29 if an order is canceled by the customer."
      ],
      [
        "What If I want to return something?",
        "If you’re dissatisfied with the products delivered, please register a complaint via the app within 48 hours for non-perishable items and 24 hours for perishable items. Our customer support team will get in touch with you to resolve this issue.You can also return the products which you are dissatisfied with, at the time of delivery and we will get the refund initiated for you."
      ],
      [
        "Can I reschedule my order?",
        "Yes, you can do this by clicking on the Need Help option in “My Orders” section. You can also reschedule your order as per your convenience basis the slots available, provided the order is not already en route. Please note: Once the order is packed, the merchant may levy a fee of Rs.29 if an order is rescheduled by the customer."
      ],
      [
        "What if I have any complaint regarding my order?",
        "You can use the “Contact Us” section on the app/web. Our customer care executives are always happy to help."
      ]
    ]
  ],
  [
    "Placing an order",
    [
      [
        "How can I be sure the fruits and vegetables I order are of good quality?",
        "Our fruits and vegetables vendors have a quality check process in place to ensure quality of the items delivered, is up to the mark. Do let us know within 24 Hours if you’re not happy with the quality of product received."
      ],
      [
        "How will I know if any item in my order is unavailable?",
        "You will receive an SMS notification informing you about the unavailable items in this situation. Refund (if any) will also be initiated within 24 hours."
      ],
      [
        "Is it safe to use my debit/credit card to shop on GROCERY?",
        "Yes, it is. All transactions on GROCERY are completed via secure payment gateways (Citrus, PayU) which are PCI and DSS compliant. We do not store your card details at any given time."
      ],
      [
        "I’m trying to place an order today but it is getting scheduled for the next day. What can I do?",
        "Depending on store timings and store capacities, your order may be scheduled for a different day."
      ],
      [
        "Can I schedule an order to my convenience?",
        "Sure. At the checkout page, you can select a delivery slot of your choice."
      ]
    ]
  ],
  [
    "Delivery related queries",
    [
      [
        "Do you charge for delivery?",
        "Every store has its own delivery charges, which are waived off if you order above a specified minimum amount from the store. The minimum charges and the delivery charges are mentioned on the app and web at the checkout page."
      ],
      [
        "What are your delivery times?",
        "In some locations, our deliveries begin from 6AM and the last delivery is completed by 11PM."
      ],
      [
        "Can I change the delivery address of my order?",
        "At this time, we do not offer this option. You can, however, cancel your order and reorder from a different locality."
      ],
      [
        "What if I don’t receive my order by the scheduled time?",
        "On rare occasions, due to unforeseen circumstances, your order might be delayed. In case of imminent delay, our customer support executive will keep you updated about the delivery time of your order."
      ]
    ]
  ]
];

var banners = [
  "https://www.bigbasket.com/media/uploads/section_item/images/hdpi/HP-Bigdays_F_V_1440X692-6thMay.jpg",
  "https://www.bigbasket.com/media/uploads/section_item/images/hdpi/HP-Bigdays_Staples_1440X692-6thMay.jpg",
  "https://www.bigbasket.com/media/uploads/section_item/images/xhdpi/App-HP-HUL-1440x692-1may18.jpg",
];

var categories = [
  {
    "image": "https://webcdn.grofers.com/cdn/pdp/category-l0-15.jpg",
    "name": "Noodles, Sauces & Instant Food"
  },
  {
    "image": "https://webcdn.grofers.com/cdn/pdp/category-l0-13.jpg",
    "name": "Biscuits, Snacks & Chocolates"
  },
  {
    "image": "https://webcdn.grofers.com/cdn/pdp/category-l0-14.jpg",
    "name": "Breakfast & Diary"
  },
  {
    "image": "https://webcdn.grofers.com/cdn/pdp/category-l0-163.jpg",
    "name": "Personal Care"
  },
  {
    "image": "https://webcdn.grofers.com/cdn/pdp/category-l0-18.jpg",
    "name": "Household Needs"
  },
  {
    "image": "https://webcdn.grofers.com/cdn/pdp/category-l0-1047.jpg",
    "name": "Home & Kitchen"
  },
  {
    "image": "https://webcdn.grofers.com/cdn/pdp/category-l0-12.jpg",
    "name": "Bevarages"
  },
  {
    "image": "https://webcdn.grofers.com/cdn/pdp/category-l0-16.jpg",
    "name": "Grocery & Staples"
  },
  {
    "image": "https://webcdn.grofers.com/cdn/pdp/category-l0-9.jpg",
    "name": "Fruits & Vegetable"
  }
];

var items = {
  1: {
    "name": "New Potato - Onion - Tomato (Hybrid)",
    "image": "https://cdn.grofers.com/app/images/products/normal/pro_369752.jpg",
    "variants": {
      1: {
        "quantity": "1 unit (1.75-2.75 kg)",
        "price": 30,
        "sale": 25,
        "amount": 0
      }
    }
  },
  2: {
    "name": "Safeda Mango",
    "image": "https://cdn.grofers.com/app/images/products/normal/pro_388616.jpg",
    "variants": {
      1: {
        "quantity": "6 units",
        "price": 180,
        "sale": 144,
        "amount": 0
      },
      // 2: {
      //   "quantity": "3 units",
      //   "price": 90,
      //   "sale": 80
      // }
    }
  },
  3: {
    "name": "Cucumber",
    "image": "https://cdn.grofers.com/app/images/products/normal/pro_240845.jpg",
    "variants": {
      1: {
        "quantity": "1 kg",
        "price": 20,
        "sale": 20,
        "amount": 0
      }
    }
  },
  4: {
    "name": "Large Round Brinjal (Bharta)",
    "image": "https://cdn.grofers.com/app/images/products/normal/pro_372347.jpg",
    "variants": {
      1: {
        "quantity": "500 - 700 gm",
        "price": 26,
        "sale": 26,
        "amount": 0
      }
    }
  },
  5: {
    "name": "Kiwi - Imported",
    "image": "https://cdn.grofers.com/app/images/products/normal/pro_381783.jpg",
    "variants": {
      1: {
        "quantity": "6 units",
        "price": 168,
        "sale": 144,
        "amount": 0
      }
    }
  },
  6: {
    "name": "Green Chilli",
    "image": "https://cdn.grofers.com/app/images/products/normal/pro_229590.jpg",
    "variants": {
      1: {
        "quantity": "200 gm",
        "price": 12,
        "sale": 9,
        "amount": 0
      }
    }
  },
  7: {
    "name": "Fresh Beans",
    "image": "https://cdn.grofers.com/app/images/products/normal/pro_327768.jpg",
    "variants": {
      1: {
        "quantity": "500 gm",
        "price": 25,
        "sale": 25,
        "amount": 0
      }
    }
  },
  8: {
    "name": "Bitter Gaurd (Karela)",
    "image": "https://cdn.grofers.com/app/images/products/normal/pro_197969.jpg",
    "variants": {
      1: {
        "quantity": "1 kg",
        "price": 50,
        "sale": 43,
        "amount": 0
      }
    }
  }
};

var orders = [
  [
    "Shipping",
    "10 April 17,10:00 AM",
    "GRDJII9891D",
    [[8, 1], [3, 1], [4, 3], [5, 7], [7, 10], [2, 1]]
  ],
  [
    "Delivered",
    "12 May 17,09:32 PM",
    "GRDJII9891D",
    [[2, 5], [1, 3], [6, 1]]
  ]
];

var cart = Set();

var price = 0;
var sale = 0;

var fruitsVegetables = Set.from([1,2,3,4,5,6,7,8]);

class Server {
  StreamController<String> _controller = new StreamController.broadcast();
  void simulateMessage(String message) {
    _controller.add(message);
  }
  Stream get messages => _controller.stream;
}

final server = new Server();