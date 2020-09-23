import Home from './pages/Home';
import PHome from './pages/PHome';
import Register from './pages/Register';
import Login from './pages/Login';
import LorForm from './pages/LorForm';
import TranscriptForm from './pages/TranscriptForm';
import Lor_requests from './pages/Lor_requests';
import StudentInfo from './pages/StudentInfo';
import Details from './Pages/Details';
import EditRequest from './Pages/EditRequest';
import EditRequestData from './Pages/EditRequestData';
import AcceptedReq from './pages/AcceptedReq';
import RefQuestions from './pages/RefQuestions';
import RefData from './pages/RefData';
import AcceptedReq1 from './Pages/AcceptedReq1';
import feedback from './Pages/Feedback';
import feedback2 from './Pages/feedback2';
import AdmHome from './Pages/AdmHome';
import AcceptedStudents from './Pages/AcceptedStudents';
import TranscriptData from './Pages/TranscriptData';
import CompletedTranscripts from './Pages/CompletedTranscripts';
import LorsIssued from './Pages/LorsIssued';
import LorsIssued1 from './Pages/LorsIssued1';



export default[
    {
        path:'/',
        component: Home,
        name:'Home'
    },

    {
        path:'/LorsIssued1',
        component:LorsIssued1,
        name:'LorsIssued1'
    },

    {
        path:'/LorsIssued',
        component:LorsIssued,
        name:'LorsIssued'
    },

    {
        path:'/CompletedTranscripts',
        component:CompletedTranscripts,
        name:'CompletedTranscripts'
    },

    {
        path:'/TranscriptData',
        component:TranscriptData,
        name:'TranscriptData'
    },

    {
        path:'/AcceptedStudents',
        component:AcceptedStudents,
        name:'AcceptedStudents'
    },

    {
        path:'/feedback2',
        component:feedback2,
        name:'feedback2'
    },

    {
        path:'/feedback',
        component:feedback,
        name:'feedback'
    },

    {
        path:'/RefData',
        component:RefData,
        name:'RefData'
    },

    {
        path:'/RefQuestions',
        component:RefQuestions,
        name:'RefQuestions '
    },

    {
        path:'/AcceptedReq',
        component: AcceptedReq,
        name:'AcceptedReq '
    },

    {
        path:'/AcceptedReq1',
        component: AcceptedReq1,
        name:'AcceptedReq1 '
    },

    {
        path:'/StudentInfo',
        component: StudentInfo,
        name:'StudentInfo '
    },

    {
        path:'/EditRequest',
        component: EditRequest,
        name:'EditRequest '
    },

    {
        path:'/EditRequestData',
        component: EditRequestData,
        name:'EditRequestData '
    },

    {
        path:'/Details',
        component: Details,
        name:'details'
    },

    {
        path:'/AdmHome',
        component: AdmHome,
        name:'AdmHome'
    },

    {
        path:'/PHome',
        component: PHome,
        name:'PHome'
    },

    {
        path:'/LorRequests',
        component: Lor_requests,
        name:'LorRequests'
    },

    {
        path:'/register',
        component: Register,
        name:'register'
    },

    {
        path:'/login',
        component:Login,
        name:'login'
    },

    {
        path:'/lorform',
        component:LorForm,
        name:'lorform'
    },

    {
        path:'/transcriptform',
        component:TranscriptForm,
        name:'transcriptform'
    }


];